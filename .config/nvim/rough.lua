-- Fix 1: Simplify and make the get_project_lists function more strict
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

-- Fix 2: Simplify the save_harpoon_list function for consistent naming
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

-- Fix 3: Simplified get_default_list_name function
local function get_default_list_name()
    local project_id = get_project_id()
    return project_id .. "_1"
end

-- Fix 4: Update load_harpoon_list to use consistent display names
local function load_harpoon_list(full_name, display_name)
    debug_log("Loading list: " .. display_name)
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

-- Fix 5: Add a cleanup function to fix existing list files
local function cleanup_harpoon_lists()
    local save_dir = vim.fn.stdpath("data") .. "/harpoon_lists"
    if vim.fn.isdirectory(save_dir) == 0 then
        return
    end

    local files = vim.fn.readdir(save_dir)
    local cleaned = 0
    local renamed = 0

    for _, file in ipairs(files) do
        if file:match("%.json$") then
            local filename = file:gsub("%.json$", "")
            
            -- Check for double project IDs or inconsistent separators
            local parts = vim.split(filename, "[_-]")
            if #parts >= 2 then
                -- If first two parts are the same (duplicate project ID)
                if parts[1] == parts[2] then
                    local new_name = parts[1] .. "_" .. table.concat(vim.list_slice(parts, 3), "_")
                    local old_path = save_dir .. "/" .. file
                    local new_path = save_dir .. "/" .. new_name .. ".json"
                    
                    if vim.fn.rename(old_path, new_path) == 0 then
                        cleaned = cleaned + 1
                    end
                end
                
                -- Convert any hyphens to underscores for consistency
                if filename:match("-") then
                    local new_name = filename:gsub("-", "_")
                    local old_path = save_dir .. "/" .. file
                    local new_path = save_dir .. "/" .. new_name .. ".json"
                    
                    if vim.fn.rename(old_path, new_path) == 0 then
                        renamed = renamed + 1
                    end
                end
            end
        end
    end
    
    if cleaned > 0 or renamed > 0 then
        vim.notify("Cleaned up Harpoon lists: " .. cleaned .. " duplicates fixed, " .. 
                  renamed .. " renamed for consistency")
    end
    
    -- Invalidate cache after cleanup
    _G.harpoon_state.project_lists_cache = nil
}

-- Fix 6: Call cleanup function during initialization
local function initialize_default_list()
    debug_log("Initializing default list")
    
    -- Run cleanup on existing files first
    cleanup_harpoon_lists()
    
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
