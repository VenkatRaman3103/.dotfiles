return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        -- Function to apply custom highlights
        local function apply_neogit_highlights()
            -- Color definitions for consistency
            local addColor = "#7ca68c"     -- Sage green for additions
            local deleteColor = "#e67e7e"  -- Soft salmon for deletions
            local changeColor = "#d2a374"  -- Warm coral for changes
            local contextColor = "#aaaaaa" -- Gray for context

            -- Base Neogit diff highlights (overview)
            vim.api.nvim_set_hl(0, "NeogitDiffAdd", { bg = "NONE", fg = addColor })
            vim.api.nvim_set_hl(0, "NeogitDiffDelete", { bg = "NONE", fg = deleteColor })
            vim.api.nvim_set_hl(0, "NeogitDiffContext", { bg = "NONE", fg = contextColor })

            -- Inside hunks - consistent with overview
            vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { bg = "NONE", fg = addColor })
            vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { bg = "NONE", fg = deleteColor })
            vim.api.nvim_set_hl(0, "NeogitDiffContextHighlight", { bg = "NONE", fg = contextColor })

            -- Override core diff highlights to ensure consistency
            vim.api.nvim_set_hl(0, "DiffAdd", { bg = "NONE", fg = addColor })
            vim.api.nvim_set_hl(0, "DiffDelete", { bg = "NONE", fg = deleteColor })
            vim.api.nvim_set_hl(0, "DiffChange", { bg = "NONE", fg = changeColor })
            vim.api.nvim_set_hl(0, "DiffText", { bg = "NONE", fg = changeColor, italic = true })

            -- Generic diff view syntax highlights
            vim.api.nvim_set_hl(0, "diffAdded", { fg = addColor, bg = "NONE" })
            vim.api.nvim_set_hl(0, "diffRemoved", { fg = deleteColor, bg = "NONE" })
            vim.api.nvim_set_hl(0, "diffChanged", { fg = changeColor, bg = "NONE" })

            -- Additional Neogit highlight groups that might be used in hunks
            vim.api.nvim_set_hl(0, "NeogitDiffAddRegion", { bg = "NONE", fg = addColor })
            vim.api.nvim_set_hl(0, "NeogitDiffDeleteRegion", { bg = "NONE", fg = deleteColor })
            vim.api.nvim_set_hl(0, "NeogitDiffContextRegion", { bg = "NONE", fg = contextColor })

            -- Use foreground colors only for hunk headers
            vim.api.nvim_set_hl(0, "NeogitHunkHeader", {
                bg = "#181818",
                fg = "#888888",
                bold = true
            })
            vim.api.nvim_set_hl(0, "NeogitHunkHeaderHighlight", {
                bg = "#181818",
                fg = "#aaaaaa",
                bold = true
            })

            -- File names with foreground styling only
            vim.api.nvim_set_hl(0, "NeogitFileName", {
                bg = "#181818",
                fg = "#aaaaaa",
                bold = true
            })

            -- Consistent status highlights using grayscale
            vim.api.nvim_set_hl(0, "NeogitBranch", { fg = "#a0a0a0", bold = true, bg = "NONE" })
            vim.api.nvim_set_hl(0, "NeogitRemote", { fg = "#909090", bold = true, bg = "NONE" })
            vim.api.nvim_set_hl(0, "NeogitUntrackedfiles", { fg = "#7a7a7a", bg = "NONE" })
            vim.api.nvim_set_hl(0, "NeogitStagedChanges", { fg = addColor, bg = "NONE" })
            vim.api.nvim_set_hl(0, "NeogitUnstagedChanges", { fg = "#5f9ea0", bg = "NONE" })
            vim.api.nvim_set_hl(0, "NeogitRecentCommits", { fg = changeColor, bg = "NONE" })
            vim.api.nvim_set_hl(0, "NeogitSectionTitle", { fg = "#ffffff", bold = true, bg = "NONE" })

            -- Notifications with subtle colors
            vim.api.nvim_set_hl(0, "NeogitNotificationInfo", { bg = "NONE", fg = "#5f9ea0" })
            vim.api.nvim_set_hl(0, "NeogitNotificationWarning", { bg = "NONE", fg = changeColor })
            vim.api.nvim_set_hl(0, "NeogitNotificationError", { fg = deleteColor, bold = true, bg = "NONE" })

            -- Change highlighting for change/delete/add words
            vim.api.nvim_set_hl(0, "NeogitChangeDeleted", { bg = "NONE", fg = deleteColor })
            vim.api.nvim_set_hl(0, "NeogitChangeBroken", { bg = "NONE", fg = changeColor })
            vim.api.nvim_set_hl(0, "NeogitChangeAdded", { bg = "NONE", fg = addColor })

            -- Additional status change highlights
            vim.api.nvim_set_hl(0, "NeogitChangeModified", { bg = "NONE", fg = changeColor })
            vim.api.nvim_set_hl(0, "NeogitChangeRenamed", { bg = "NONE", fg = "#d2a374" })
            vim.api.nvim_set_hl(0, "NeogitChangeCopied", { bg = "NONE", fg = "#a0a0a0" })
            vim.api.nvim_set_hl(0, "NeogitChangeUpdated", { bg = "NONE", fg = "#5f9ea0" })
            vim.api.nvim_set_hl(0, "NeogitChangeNew", { bg = "NONE", fg = addColor })
        end

        -- Pre-patch Neogit's highlight system before it loads
        local function patch_neogit_highlights()
            -- Get the neogit buffer module
            local buffer_ok, buffer_lib = pcall(require, "neogit.lib.buffer")
            if not buffer_ok then
                return false
            end

            -- Store original add_highlight function
            local original_add_highlight = buffer_lib.add_highlight

            -- Patch the add_highlight function to handle nil hl gracefully
            buffer_lib.add_highlight = function(self, line, col_start, col_end, hl_group, priority)
                -- Ensure hl_group is valid
                if not hl_group or type(hl_group) ~= "string" then
                    return
                end

                -- Ensure the highlight group exists
                if vim.fn.hlexists(hl_group) == 0 then
                    vim.api.nvim_set_hl(0, hl_group, { link = "Normal" })
                end

                -- Call original function with safe parameters
                return original_add_highlight(self, line or 0, col_start or 0, col_end or -1, hl_group, priority or 100)
            end

            return true
        end

        -- Add delay to ensure proper loading order
        vim.defer_fn(function()
            local success, neogit = pcall(require, "neogit")
            if not success then
                vim.notify("Failed to load neogit: " .. tostring(neogit), vim.log.levels.ERROR)
                return
            end

            -- Try to patch the highlight system
            local patch_success = patch_neogit_highlights()
            if not patch_success then
                vim.notify("Could not patch neogit highlights - proceeding with caution", vim.log.levels.WARN)
            end

            -- Create comprehensive highlight groups before neogit setup
            local function create_all_neogit_highlights()
                local highlight_groups = {
                    -- Basic groups
                    "NeogitBranch", "NeogitRemote", "NeogitHunkHeader", "NeogitHunkHeaderHighlight",
                    "NeogitDiffAdd", "NeogitDiffDelete", "NeogitDiffContext",
                    "NeogitDiffAddHighlight", "NeogitDiffDeleteHighlight", "NeogitDiffContextHighlight",

                    -- Status groups
                    "NeogitChangeModified", "NeogitChangeAdded", "NeogitChangeDeleted",
                    "NeogitChangeRenamed", "NeogitChangeCopied", "NeogitChangeUpdated", "NeogitChangeNew",

                    -- Section groups
                    "NeogitSectionHeader", "NeogitSubtleText", "NeogitUntrackedfiles", "NeogitUnstagedchanges",
                    "NeogitStagedchanges", "NeogitStashes", "NeogitUnpulledchanges", "NeogitUnpushedchanges",
                    "NeogitRecentcommits", "NeogitUnmergedchanges",

                    -- Notification groups
                    "NeogitNotificationInfo", "NeogitNotificationWarning", "NeogitNotificationError",

                    -- Cursor groups
                    "NeogitCursorLine",

                    -- Popup groups
                    "NeogitPopupSectionTitle", "NeogitPopupBranchName", "NeogitPopupBold",
                    "NeogitPopupSwitchKey", "NeogitPopupSwitchEnabled", "NeogitPopupSwitchDisabled",
                    "NeogitPopupOptionKey", "NeogitPopupOptionEnabled", "NeogitPopupOptionDisabled",
                    "NeogitPopupConfigKey", "NeogitPopupConfigEnabled", "NeogitPopupConfigDisabled",
                    "NeogitPopupActionKey", "NeogitPopupActionDisabled",

                    -- Sign groups
                    "NeogitSignsAdd", "NeogitSignsChange", "NeogitSignsDelete",
                }

                for _, group in ipairs(highlight_groups) do
                    if vim.fn.hlexists(group) == 0 then
                        -- Create basic highlight that links to a safe group
                        vim.api.nvim_set_hl(0, group, { link = "Normal" })
                    end
                end
            end

            create_all_neogit_highlights()

            -- Ultra-minimal neogit setup
            local setup_success, setup_error = pcall(function()
                neogit.setup({
                    -- Disable everything possible
                    integrations = {},

                    -- Use plain text signs
                    signs = {
                        section = { ">", "v" },
                        item = { "*", "*" },
                        hunk = { "", "" },
                    },

                    -- Minimal configuration
                    disable_line_numbers = true,
                    disable_signs = false,               -- Keep signs but make them simple
                    disable_context_highlighting = true, -- Disable problematic highlighting
                    disable_commit_confirmation = true,

                    -- Simple status config
                    status = {
                        recent_commit_count = 3,
                        HEAD_padding = 3,
                        mode_padding = 1,
                    },

                    -- Conservative popup settings
                    popup = {
                        kind = "split",
                    },

                    -- Minimal mappings
                    mappings = {
                        status = {
                            ["<tab>"] = "Toggle",
                            ["s"] = "Stage",
                            ["u"] = "Unstage",
                            ["q"] = "Close",
                            ["<C-r>"] = "RefreshBuffer",
                        },
                    },
                })
            end)

            if not setup_success then
                vim.notify("Neogit setup failed: " .. tostring(setup_error), vim.log.levels.ERROR)
                return
            end

            -- *** APPLY CUSTOM HIGHLIGHTS AFTER NEOGIT SETUP ***
            -- This is the key fix - apply highlights after Neogit is configured
            vim.defer_fn(function()
                apply_neogit_highlights()
            end, 100) -- Small delay to ensure Neogit is fully loaded

            -- Safe toggle function
            vim.keymap.set("n", "<leader>go", function()
                -- Check git repo
                local git_check = vim.fn.system("git rev-parse --git-dir 2>/dev/null")
                if git_check:match("^fatal:") then
                    vim.notify("Not in a git repository", vim.log.levels.WARN)
                    return
                end

                local success, error_msg = pcall(function()
                    -- Check if already open
                    local current_ft = vim.bo.filetype
                    if current_ft == 'NeogitStatus' then
                        vim.cmd('bdelete!')
                    else
                        -- Try opening with error handling
                        neogit.open()
                        -- Reapply highlights after opening
                        vim.defer_fn(apply_neogit_highlights, 50)
                    end
                end)

                if not success then
                    vim.notify("Neogit error: " .. tostring(error_msg), vim.log.levels.ERROR)
                    -- Try alternative approach
                    pcall(function()
                        vim.cmd('tabnew | terminal git status')
                    end)
                end
            end, { desc = "Toggle Neogit", silent = true })

            -- Emergency fallback command
            vim.api.nvim_create_user_command("NeogitFallback", function()
                vim.cmd('tabnew | terminal lazygit || git status')
            end, { desc = "Fallback git interface" })

            -- Basic git commands that don't use neogit
            vim.keymap.set("n", "<leader>ga", function()
                vim.fn.system("git add .")
                vim.notify("Added all files", vim.log.levels.INFO)
            end, { desc = "Git add all" })

            vim.keymap.set("n", "<leader>gc", function()
                vim.cmd('terminal git commit')
            end, { desc = "Git commit" })

            vim.keymap.set("n", "<leader>gp", function()
                local output = vim.fn.system("git push 2>&1")
                if vim.v.shell_error == 0 then
                    vim.notify("Push successful", vim.log.levels.INFO)
                else
                    vim.notify("Push failed: " .. output, vim.log.levels.ERROR)
                end
            end, { desc = "Git push" })

            -- Autocmd to reapply highlights when Neogit buffers are opened
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "NeogitStatus",
                callback = function()
                    pcall(function()
                        vim.opt_local.number = false
                        vim.opt_local.relativenumber = false
                        vim.opt_local.signcolumn = "no"
                        -- Disable all highlighting features that might cause issues
                        vim.opt_local.syntax = "off"

                        -- Reapply custom highlights
                        vim.defer_fn(apply_neogit_highlights, 10)
                    end)
                end,
            })

            -- Also reapply highlights when colorscheme changes
            vim.api.nvim_create_autocmd("ColorScheme", {
                callback = function()
                    vim.defer_fn(apply_neogit_highlights, 100)
                end,
            })
        end, 200) -- Increased delay to 200ms
    end,
}
