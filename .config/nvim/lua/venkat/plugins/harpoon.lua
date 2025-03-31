return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        -- Debug utility - set to true if you want debug messages
        local debug_mode = false
        local function debug_log(msg)
            if debug_mode then
                vim.notify("Harpoon debug: " .. msg)
            end
        end

        -- Store current active list information globally
        if not _G.harpoon_state then
            _G.harpoon_state = {
                current_list_counter = 1,
                project_root_cache = nil,
                project_id_cache = nil,
                project_lists_cache = nil,
            }
        end

        -- Ensure active_harpoon_list is initialized for lualine compatibility
        _G.active_harpoon_list = _G.active_harpoon_list or nil

        -- Basic Harpoon navigation
        vim.keymap.set("n", "<leader>ho", ui.toggle_quick_menu, { desc = "Open Harpoon Menu" })

        -- Utility function to normalize paths by replacing dashes with underscores
        local function normalize_path(path)
            return path:gsub("%-", "_")
        end

        -- Get current project's root directory (cached)
        local function get_project_root()
            -- Use cached value if available
            if _G.harpoon_state.project_root_cache then
                return _G.harpoon_state.project_root_cache
            end

            debug_log("Detecting project root")
            -- Try to use git root if available
            local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("%s+$", "")
            if git_root ~= "" and vim.v.shell_error == 0 then
                -- Format root folder name replacing "-" with "_"
                git_root = normalize_path(git_root)
                _G.harpoon_state.project_root_cache = git_root
                return git_root
            end
            -- Fallback to current working directory
            local cwd = vim.fn.getcwd()
            -- Format root folder name replacing "-" with "_"
            cwd = normalize_path(cwd)
            _G.harpoon_state.project_root_cache = cwd
            return _G.harpoon_state.project_root_cache
        end

        -- Get a unique identifier for the current project that's consistent (cached)
        local function get_project_id()
            -- Use cached value if available
            if _G.harpoon_state.project_id_cache then
                return _G.harpoon_state.project_id_cache
            end

            local project_path = get_project_root()

            -- Try to use a consistent project identifier
            local project_name = nil

            -- Option 1: Check if we're in a git repo and use the repo name
            local git_origin = vim.fn.system("git config --get remote.origin.url 2>/dev/null"):gsub("%s+$", "")
            if git_origin ~= "" and vim.v.shell_error == 0 then
                -- Extract repo name from git URL
                project_name = git_origin:match("([^/]+)%.git$") or git_origin:match("[^/]+$")
            end

            -- Option 2: If no git remote or couldn't extract name, use parent directory + current directory
            if not project_name or project_name == "" then
                local parent_dir = vim.fn.fnamemodify(project_path, ":h:t")
                local current_dir = vim.fn.fnamemodify(project_path, ":t")
                project_name = parent_dir .. "-" .. current_dir
            end

            -- Fallback to just the directory name if all else fails
            if not project_name or project_name == "" then
                project_name = vim.fn.fnamemodify(project_path, ":t")
            end

            -- Always normalize the project name by replacing dashes with underscores
            project_name = normalize_path(project_name)

            _G.harpoon_state.project_id_cache = project_name
            return project_name
        end

        -- Get default list name for the current project
        local function get_default_list_name()
            local project_id = get_project_id()
            return project_id .. "_1"
        end

        -- Functions to save/load Harpoon lists with project awareness
        -- Modify the save_harpoon_list function to avoid redundancy
        local function save_harpoon_list(name)
            debug_log("Saving list: " .. name)
            -- Get current marked files
            local harpoon_module = require("harpoon")
            local marks = harpoon_module.get_mark_config().marks

            -- Create directory if it doesn't exist
            local save_dir = vim.fn.stdpath("data") .. "/harpoon_lists"
            if vim.fn.isdirectory(save_dir) == 0 then
                vim.fn.mkdir(save_dir, "p")
            end

            -- Make sure name is normalized
            name = normalize_path(name)

            -- Add project identifier to the save name with consistent format
            local project_id = get_project_id()
            local display_name = name

            -- Clean up the name to avoid potential duplications
            -- Remove any project_id prefix if already present
            name = name:gsub("^" .. project_id .. "_", "")

            -- Use simple consistent format: project_id_name
            local file_name = project_id .. "_" .. name

            -- Use consistent file path
            local file_path = save_dir .. "/" .. file_name .. ".json"

            debug_log("Saving to path: " .. file_path)

            local file = io.open(file_path, "w")
            if file then
                file:write(vim.fn.json_encode(marks))
                file:close()

                -- Set as active Harpoon list for lualine compatibility
                _G.active_harpoon_list = display_name

                -- Invalidate cache
                _G.harpoon_state.project_lists_cache = nil

                -- Defer status redraw
                vim.defer_fn(function() vim.cmd("redrawstatus") end, 1)

                return true, project_id
            end
            return false, nil
        end

        local function load_harpoon_list(full_name, display_name)
            debug_log("Loading list: " .. display_name)

            -- Ensure both names are normalized
            full_name = normalize_path(full_name)
            display_name = normalize_path(display_name)

            local file_path = vim.fn.stdpath("data") .. "/harpoon_lists/" .. full_name .. ".json"

            -- For debugging
            debug_log("Looking for file at: " .. file_path)

            local file = io.open(file_path, "r")
            if file then
                local content = file:read("*a")
                file:close()

                -- Clear current marks
                mark.clear_all()

                -- Load new marks
                local marks = vim.fn.json_decode(content)
                for _, file_info in ipairs(marks) do
                    -- We need to use add_file with the filename from the saved mark
                    mark.add_file(file_info.filename)
                end

                -- Set active Harpoon list name for lualine compatibility
                -- Make sure we're using the cleaned display name
                _G.active_harpoon_list = display_name

                -- Defer status redraw
                vim.defer_fn(function() vim.cmd("redrawstatus") end, 1)

                return true
            else
                debug_log("Failed to open file: " .. file_path)
            end
            return false
        end

        -- Delete a harpoon list file
        local function delete_harpoon_list(full_name, display_name)
            debug_log("Deleting list: " .. display_name)

            -- Ensure both names are normalized
            full_name = normalize_path(full_name)
            display_name = normalize_path(display_name)

            local file_path = vim.fn.stdpath("data") .. "/harpoon_lists/" .. full_name .. ".json"
            local result = os.remove(file_path)

            -- If we deleted the active list, clear the active list name
            if _G.active_harpoon_list == display_name then
                _G.active_harpoon_list = nil
                -- Defer status redraw
                vim.defer_fn(function() vim.cmd("redrawstatus") end, 1)
            end

            -- Invalidate cache
            _G.harpoon_state.project_lists_cache = nil

            return result ~= nil
        end

        -- Get lists for the current project with caching
        local function get_project_lists()
            -- Use cached result if available
            if _G.harpoon_state.project_lists_cache then
                return _G.harpoon_state.project_lists_cache
            end

            debug_log("Scanning for project lists")
            local project_id = get_project_id()
            local save_dir = vim.fn.stdpath("data") .. "/harpoon_lists"

            if vim.fn.isdirectory(save_dir) == 0 then
                _G.harpoon_state.project_lists_cache = {}
                return {}
            end

            -- Get list of saved files
            local files = vim.fn.readdir(save_dir)
            local lists = {}

            debug_log("Project ID: " .. project_id)
            debug_log("Found " .. #files .. " files in harpoon_lists directory")

            -- Simplified matching - only match exact project ID prefix
            for _, file in ipairs(files) do
                if file:match("%.json$") then
                    local list_name = file:gsub("%.json$", "")

                    -- Normalize the list name
                    list_name = normalize_path(list_name)

                    -- Only match files that start with project_id followed by underscore
                    if list_name:match("^" .. project_id .. "_") then
                        -- Extract display name - get everything after the project_id_
                        local display_name = list_name:gsub("^" .. project_id .. "_", "")

                        table.insert(lists, {
                            full_name = list_name,
                            display_name = display_name
                        })
                    end
                end
            end

            -- Sort the lists
            table.sort(lists, function(a, b)
                local a_num = tonumber(a.display_name:match("^(%d+)$"))
                local b_num = tonumber(b.display_name:match("^(%d+)$"))

                if a_num and b_num then
                    return a_num < b_num
                elseif a_num then
                    return true
                elseif b_num then
                    return false
                else
                    return a.display_name < b.display_name
                end
            end)

            -- Cache the result
            _G.harpoon_state.project_lists_cache = lists
            return lists
        end

        local function find_highest_list_number()
            local lists = get_project_lists()
            local highest = 0

            for _, list in ipairs(lists) do
                local num = tonumber(list.display_name:match("_?(%d+)$"))
                if num and num > highest then
                    highest = num
                end
            end

            return highest
        end

        -- Initialize default list (with lazy loading for startup performance)
        local function initialize_default_list()
            debug_log("Initializing default list")
            local project_lists = get_project_lists()

            -- If no lists exist for this project, we'll create the default one on first add
            if #project_lists == 0 then
                _G.harpoon_state.current_list_counter = 1
                _G.active_harpoon_list = nil -- No active list yet
                return
            end

            -- Otherwise, find the highest number
            _G.harpoon_state.current_list_counter = find_highest_list_number()

            -- If there's at least one list, load the first one by default
            if #project_lists > 0 then
                load_harpoon_list(project_lists[1].full_name, project_lists[1].display_name)
            end
        end

        -- Add current file to Harpoon with auto-save to active list
        vim.keymap.set("n", "<leader>a", function()
            local fileName = vim.fn.expand("%:t")
            mark.add_file()

            -- If no active list, create a default one
            if not _G.active_harpoon_list then
                local default_name = get_default_list_name()
                save_harpoon_list(default_name)
                vim.notify(fileName .. " added to new list '" .. default_name .. "'")
            else
                -- Save to active list
                save_harpoon_list(_G.active_harpoon_list)
                vim.notify(fileName .. " added to list '" .. _G.active_harpoon_list .. "'")
            end
        end, { desc = "Add File to Current Harpoon List" })

        -- Create a new empty Harpoon list (auto-increment suffix)
        vim.keymap.set("n", "<leader>hn", function()
            -- Clear current marks first
            mark.clear_all()

            -- Increment counter and create new list name
            _G.harpoon_state.current_list_counter = _G.harpoon_state.current_list_counter + 1
            local new_list_name = get_project_id() .. "_" .. _G.harpoon_state.current_list_counter

            -- Ask if user wants to rename
            vim.ui.select({ "Use default name: " .. new_list_name, "Choose custom name" }, {
                prompt = "New empty list name:",
            }, function(choice)
                if choice and choice:match("Use default") then
                    -- Use default name
                    save_harpoon_list(new_list_name)
                    vim.notify("Created new empty list '" .. new_list_name .. "'")
                elseif choice and choice:match("Choose custom") then
                    -- Ask for custom name
                    local custom_name = vim.fn.input("Enter custom list name: ")
                    if custom_name ~= "" then
                        -- Normalize custom name
                        custom_name = normalize_path(custom_name)
                        save_harpoon_list(custom_name)
                        vim.notify("Created new empty list '" .. custom_name .. "'")
                    else
                        vim.notify("Operation cancelled", vim.log.levels.WARN)
                    end
                end
            end)
        end, { desc = "Create New Empty Harpoon List" })

        -- Remove current file from Harpoon and auto-save
        vim.keymap.set("n", "<leader>hx", function()
            local fileName = vim.fn.expand("%:t")
            mark.rm_file()
            vim.notify(fileName .. " removed from Harpoon")

            -- Save changes to active list if one exists
            if _G.active_harpoon_list then
                save_harpoon_list(_G.active_harpoon_list)
            end
        end, { desc = "Remove File from Harpoon" })

        -- Clear all Harpoon marks
        vim.keymap.set("n", "<leader>hc", function()
            mark.clear_all()
            vim.notify("Harpoon list cleared")

            -- Prompt to save the cleared list
            if _G.active_harpoon_list then
                vim.ui.select({ "Yes", "No" }, {
                    prompt = "Save the cleared list '" .. _G.active_harpoon_list .. "'?",
                }, function(choice)
                    if choice == "Yes" then
                        save_harpoon_list(_G.active_harpoon_list)
                        vim.notify("Saved empty list '" .. _G.active_harpoon_list .. "'")
                    end
                end)
            end
        end, { desc = "Clear Harpoon List" })

        -- Quick navigation to Harpoon files
        vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Harpoon File 1" })
        vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "Harpoon File 2" })
        vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "Harpoon File 3" })
        vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "Harpoon File 4" })
        vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end, { desc = "Harpoon File 5" })

        -- Navigate to next/prev Harpoon file
        vim.keymap.set("n", "<S-j>", function()
            ui.nav_next()
        end, { desc = "Next Harpoon File" })

        vim.keymap.set("n", "<S-k>", function()
            ui.nav_prev()
        end, { desc = "Previous Harpoon File" })

        -- Display current file's position in Harpoon list
        vim.keymap.set("n", "<leader>hw", function()
            local current_file = vim.fn.expand("%:p")
            local marks = require("harpoon").get_mark_config().marks

            for idx, file in ipairs(marks) do
                if file.filename == current_file then
                    vim.notify("Current file is #" ..
                        idx .. " in Harpoon list '" .. (_G.active_harpoon_list or "unnamed") .. "'")
                    return
                end
            end
            vim.notify("Current file is not in Harpoon")
        end, { desc = "Where in Harpoon?" })

        -- Rename current Harpoon list
        vim.keymap.set("n", "<leader>hr", function()
            if not _G.active_harpoon_list then
                vim.notify("No active list to rename", vim.log.levels.WARN)
                return
            end

            local current_name = _G.active_harpoon_list
            local new_name = vim.fn.input("Rename list '" .. current_name .. "' to: ")
            if new_name ~= "" then
                -- Normalize new name
                new_name = normalize_path(new_name)

                -- Get current list content
                local harpoon_module = require("harpoon")
                local marks = harpoon_module.get_mark_config().marks

                -- Create the full names - use consistent underscore format
                local project_id = get_project_id()
                local old_full_name = project_id .. "_" .. current_name

                -- Delete old list
                delete_harpoon_list(old_full_name, current_name)

                -- Save with new name
                save_harpoon_list(new_name)
                vim.notify("Renamed list to '" .. new_name .. "'")
            end
        end, { desc = "Rename Current Harpoon List" })

        -- Save current Harpoon list with option to rename
        vim.keymap.set("n", "<leader>hs", function()
            if not _G.active_harpoon_list then
                local default_name = get_default_list_name()
                local new_name = vim.fn.input("Save Harpoon list as (default: " .. default_name .. "): ")

                if new_name == "" then
                    new_name = default_name
                else
                    -- Normalize new name
                    new_name = normalize_path(new_name)
                end

                local success, project_id = save_harpoon_list(new_name)
                if success then
                    vim.notify("Harpoon list saved as '" .. new_name .. "' for project '" .. project_id .. "'")
                else
                    vim.notify("Failed to save Harpoon list", vim.log.levels.ERROR)
                end
            else
                vim.ui.select({ "Save to current list: " .. _G.active_harpoon_list, "Save as new list" }, {
                    prompt = "Save options:",
                }, function(choice)
                    if choice and choice:match("Save to current") then
                        local success = save_harpoon_list(_G.active_harpoon_list)
                        if success then
                            vim.notify("Saved changes to list '" .. _G.active_harpoon_list .. "'")
                        else
                            vim.notify("Failed to save Harpoon list", vim.log.levels.ERROR)
                        end
                    elseif choice and choice:match("Save as new") then
                        local new_name = vim.fn.input("Save Harpoon list as: ")
                        if new_name ~= "" then
                            -- Normalize new name
                            new_name = normalize_path(new_name)
                            local success, project_id = save_harpoon_list(new_name)
                            if success then
                                vim.notify("Harpoon list saved as '" ..
                                    new_name .. "' for project '" .. project_id .. "'")
                            else
                                vim.notify("Failed to save Harpoon list", vim.log.levels.ERROR)
                            end
                        end
                    end
                end)
            end
        end, { desc = "Save Harpoon List" })

        -- Load a saved Harpoon list
        vim.keymap.set("n", "<leader>hl", function()
            local project_lists = get_project_lists()

            if #project_lists == 0 then
                vim.notify("No saved Harpoon lists found for this project", vim.log.levels.WARN)
                return
            end

            -- Extract display names for the UI
            local display_names = {}
            for i, list_info in ipairs(project_lists) do
                display_names[i] = list_info.display_name
            end

            -- Show selection menu using vim.ui.select
            vim.ui.select(display_names, {
                prompt = "Select Harpoon list to load:",
            }, function(choice, idx)
                if choice and idx then
                    if load_harpoon_list(project_lists[idx].full_name, project_lists[idx].display_name) then
                        vim.notify("Loaded Harpoon list '" .. choice .. "'")
                    else
                        vim.notify("Failed to load Harpoon list", vim.log.levels.ERROR)
                    end
                end
            end)
        end, { desc = "Load Harpoon List" })

        -- Delete a saved Harpoon list
        vim.keymap.set("n", "<leader>hd", function()
            local project_lists = get_project_lists()

            if #project_lists == 0 then
                vim.notify("No saved Harpoon lists found for this project", vim.log.levels.WARN)
                return
            end

            -- Extract display names for the UI
            local display_names = {}
            for i, list_info in ipairs(project_lists) do
                display_names[i] = list_info.display_name
            end

            -- Show selection menu using vim.ui.select
            vim.ui.select(display_names, {
                prompt = "Select Harpoon list to delete:",
            }, function(choice, idx)
                if choice and idx then
                    -- Confirm deletion
                    vim.ui.select({ "Yes", "No" }, {
                        prompt = "Are you sure you want to delete '" .. choice .. "'?",
                    }, function(confirm)
                        if confirm == "Yes" then
                            if delete_harpoon_list(project_lists[idx].full_name, project_lists[idx].display_name) then
                                vim.notify("Deleted Harpoon list '" .. choice .. "'", vim.log.levels.WARN)
                            else
                                vim.notify("Failed to delete Harpoon list", vim.log.levels.ERROR)
                            end
                        end
                    end)
                end
            end)
        end, { desc = "Delete Harpoon List" })

        -- List management menu with expanded options
        vim.keymap.set("n", "<leader>hm", function()
            vim.ui.select({
                "Load List",
                "Save List",
                "Delete List",
                "Create New Empty List",
                "Rename Current List"
            }, {
                prompt = "Harpoon List Management:",
            }, function(choice)
                if choice == "Load List" then
                    vim.cmd("normal <leader>hl")
                elseif choice == "Save List" then
                    vim.cmd("normal <leader>hs")
                elseif choice == "Delete List" then
                    vim.cmd("normal <leader>hd")
                elseif choice == "Create New Empty List" then
                    vim.cmd("normal <leader>hn")
                elseif choice == "Rename Current List" then
                    vim.cmd("normal <leader>hr")
                end
            end)
        end, { desc = "Harpoon List Management" })

        -- Lightweight status updater for statusline
        local status_update_timer = nil
        local function setup_status_update()
            -- Clear existing timer if any
            if status_update_timer then
                status_update_timer:stop()
                status_update_timer:close()
            end

            -- Setup new timer for periodic updates
            status_update_timer = vim.loop.new_timer()
            status_update_timer:start(1000, 5000, vim.schedule_wrap(function()
                if _G.active_harpoon_list then
                    -- Get count of files in current list
                    local harpoon_module = require("harpoon")
                    local marks = harpoon_module.get_mark_config().marks
                    local file_count = #marks

                    -- This is compatible with the original lualine config
                    -- Only update _G.active_harpoon_list if content changed (add count in parens)
                    if not string.match(_G.active_harpoon_list, " %(") then
                        -- _G.active_harpoon_list = _G.active_harpoon_list .. " (" .. file_count .. " files)"
                        _G.active_harpoon_list = _G.active_harpoon_list
                    else
                        -- Update just the count if the format is already correct
                        _G.active_harpoon_list = string.gsub(_G.active_harpoon_list, " %(%d+ files%)",
                            " (" .. file_count .. " files)")
                    end

                    -- Redraw status
                    vim.cmd("redrawstatus")
                end
            end))
        end

        -- Replace the autocmd with a periodic timer for status updates
        setup_status_update()

        -- Defer initialization to after startup is complete
        vim.defer_fn(function()
            debug_log("Performing deferred initialization")
            initialize_default_list()
        end, 200) -- 200ms after startup

        -- Command to show current project identification info
        vim.api.nvim_create_user_command("HarpoonProjectInfo", function()
            local project_root = get_project_root()
            local project_id = get_project_id()
            local lists = get_project_lists()
            local lists_str = ""

            for i, list in ipairs(lists) do
                lists_str = lists_str .. "\n  " .. i .. ". " .. list.display_name .. " (full: " .. list.full_name .. ")"
            end

            local info = "Harpoon Project Info:\n" ..
                "Project Root: " .. project_root .. "\n" ..
                "Project ID: " .. project_id .. "\n" ..
                "Active List: " .. (_G.active_harpoon_list or "none") .. "\n" ..
                "Available Lists:" .. (lists_str ~= "" and lists_str or " none")

            vim.notify(info, vim.log.levels.INFO, { title = "Harpoon Debug" })
        end, {})

        vim.api.nvim_create_user_command("HarpoonListFiles", function()
            local save_dir = vim.fn.stdpath("data") .. "/harpoon_lists"
            if vim.fn.isdirectory(save_dir) == 0 then
                vim.notify("Harpoon lists directory does not exist", vim.log.levels.WARN)
                return
            end

            local files = vim.fn.readdir(save_dir)
            local file_list = "Harpoon list files in " .. save_dir .. ":\n"

            for i, file in ipairs(files) do
                file_list = file_list .. "  " .. i .. ". " .. file .. "\n"
            end

            vim.notify(file_list, vim.log.levels.INFO, { title = "Harpoon Files" })
        end, {})

        -- Comprehensive fix for all file names
        vim.api.nvim_create_user_command("HarpoonFixFileNames", function()
            local save_dir = vim.fn.stdpath("data") .. "/harpoon_lists"
            if vim.fn.isdirectory(save_dir) == 0 then
                vim.notify("Harpoon lists directory does not exist", vim.log.levels.WARN)
                return
            end

            local files = vim.fn.readdir(save_dir)
            local renamed = 0

            for _, file in ipairs(files) do
                if file:match("%.json$") then
                    local filename = file:gsub("%.json$", "")
                    local normalized = normalize_path(filename)

                    -- Replace any dashes with underscores in the filename
                    if normalized ~= filename then
                        local old_path = save_dir .. "/" .. file
                        local new_path = save_dir .. "/" .. normalized .. ".json"

                        if vim.fn.rename(old_path, new_path) == 0 then
                            renamed = renamed + 1
                        end
                    end

                    -- Check for inconsistent separators (like -- vs _)
                    local fixed_name = normalized:gsub("%-%-", "_")

                    -- Extract project ID (first part before any separator)
                    local project_id = fixed_name:match("^([^_%-]+)")

                    if project_id then
                        -- Handle cases with double project IDs
                        fixed_name = fixed_name:gsub("^" .. project_id .. "_" .. project_id .. "_", project_id .. "_")
                        -- Fix any other inconsistent format
                        fixed_name = fixed_name:gsub(project_id .. "%-%-", project_id .. "_")

                        if fixed_name ~= normalized then
                            local old_path = save_dir .. "/" .. normalized .. ".json"
                            if vim.fn.filereadable(old_path) == 1 then
                                local new_path = save_dir .. "/" .. fixed_name .. ".json"
                                if vim.fn.rename(old_path, new_path) == 0 then
                                    renamed = renamed + 1
                                end
                            end
                        end
                    end
                end
            end

            vim.notify("Fixed " .. renamed .. " inconsistent Harpoon file names", vim.log.levels.INFO)

            -- Invalidate cache after cleanup
            _G.harpoon_state.project_lists_cache = nil
        end, {})

        -- Function to clean up and normalize all lists
        local function cleanup_harpoon_lists()
            local save_dir = vim.fn.stdpath("data") .. "/harpoon_lists"
            if vim.fn.isdirectory(save_dir) == 0 then
                vim.notify("Harpoon lists directory does not exist", vim.log.levels.WARN)
                return
            end

            -- Invalidate caches first
            _G.harpoon_state.project_lists_cache = nil
            _G.harpoon_state.project_root_cache = nil
            _G.harpoon_state.project_id_cache = nil

            -- Call the fix command
            vim.cmd("HarpoonFixFileNames")

            -- Reload the current list if it exists
            if _G.active_harpoon_list then
                local project_id = get_project_id()
                local full_name = project_id .. "_" .. _G.active_harpoon_list
                load_harpoon_list(full_name, _G.active_harpoon_list)
            end

            vim.notify("Harpoon lists have been cleaned up and normalized", vim.log.levels.INFO)
        end

        -- Create command for cleanup
        vim.api.nvim_create_user_command("HarpoonCleanup", function()
            cleanup_harpoon_lists()
        end, {})

        -- Status line component for use with lualine
        -- Add to lualine sections with: lualine_x = {..., require('harpoon-config').lualine_component, ...}
        local M = {}

        M.lualine_component = function()
            if _G.active_harpoon_list then
                -- Count current marks
                local harpoon_module = require("harpoon")
                local marks = harpoon_module.get_mark_config().marks
                local count = #marks

                return "⚓ " .. _G.active_harpoon_list .. " (" .. count .. ")"
            else
                return "⚓ No List"
            end
        end

        -- Reset cache when navigating to a new buffer
        vim.api.nvim_create_autocmd({ "BufEnter" }, {
            callback = function()
                -- Only invalidate root/project caches if we're in a different directory
                local current_dir = vim.fn.getcwd()
                if _G.harpoon_state.last_cwd ~= current_dir then
                    _G.harpoon_state.last_cwd = current_dir
                    _G.harpoon_state.project_root_cache = nil
                    _G.harpoon_state.project_id_cache = nil
                    _G.harpoon_state.project_lists_cache = nil

                    -- Re-initialize for the new project
                    vim.defer_fn(initialize_default_list, 100)
                end
            end
        })

        -- Hide the component when no list is active
        _G.active_harpoon_list = nil

        -- Automatically run cleanup on startup (can be removed if causing issues)
        vim.defer_fn(cleanup_harpoon_lists, 1000)

        -- Export module for use elsewhere
        return M
    end
} -- Function to clean up and normalize all lists
