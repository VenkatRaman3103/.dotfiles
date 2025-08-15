return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
        -- local bgColor = "#060606" -- Dark gray background color
        -- local bgColor = "#090909" -- Dark gray background color
        -- local bgColor = "#0c0c0c" -- Dark gray background color
        local bgColor = "" -- Dark gray background color

        -- Create global table for storing tab names
        _G.custom_tab_names = _G.custom_tab_names or {}

        -- Create global variable for active Harpoon list
        _G.active_harpoon_list = _G.active_harpoon_list or nil

        -- Tab renaming functionality
        local function rename_tab()
            local current_tab = vim.fn.tabpagenr()
            local new_name = vim.fn.input("New tab name: ")
            if new_name ~= "" then
                _G.custom_tab_names[current_tab] = new_name
                -- Force lualine to refresh
                vim.cmd("redrawtabline")
            end
        end

        -- Function to get tab name
        local function get_tab_name(nr)
            return _G.custom_tab_names[nr] or tostring(nr)
        end

        function split(str, delimiter)
            local result = {}
            for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
                table.insert(result, match)
            end
            return result
        end

        -- -- Function to get active Harpoon list name
        -- local function get_active_harpoon_list()
        --     if _G.active_harpoon_list then
        --         local parts = split(_G.active_harpoon_list, ':') -- Splitting the string
        --         local folder_part = parts[1]                     -- First part (before ':')
        --         local list_part = parts[2]                       -- Second part (after ':')
        --
        --         return list_part or
        --             "" -- Return list_part if it exists, otherwise return an empty string
        --     else
        --         return ""
        --     end
        -- end

        -- -- Function to get Harpoon marks count
        -- local function get_harpoon_marks()
        --     local ok, harpoon = pcall(require, "harpoon")
        --     if not ok then
        --         return ""
        --     end
        --
        --     local marks = harpoon:list():length()
        --     if marks > 0 then
        --         return "⚓ " .. marks
        --     else
        --         return ""
        --     end
        -- end

        -- Create the command for tab renaming
        vim.api.nvim_create_user_command("RenameTab", rename_tab, {})

        require("lualine").setup({
            options = {
                theme = {
                    normal = {
                        a = { fg = "#eeeeee", bg = bgColor },
                        b = { fg = "#eeeeee", bg = bgColor },
                        c = { fg = "#eeeeee", bg = bgColor },
                    },
                    insert = { a = { fg = "#eeeeee", bg = bgColor } },
                    visual = { a = { fg = "#eeeeee", bg = bgColor } },
                    replace = { a = { fg = "#eeeeee", bg = bgColor } },
                    command = { a = { fg = "#eeeeee", bg = bgColor } },
                },
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                global_status = false,
                always_divide_middle = true,
            },
            sections = {
                lualine_a = {
                    -- {
                    --     function()
                    --         local mode_map = {
                    --             n = "NORMAL",
                    --             i = "INSERT",
                    --             v = "VISUAL",
                    --             V = "V-LINE",
                    --             [""] = "V-BLOCK",
                    --             c = "COMMAND",
                    --             R = "REPLACE",
                    --             t = "TERMINAL",
                    --         }
                    --
                    --         local mode = vim.fn.mode()
                    --         local mode_name = mode_map[mode] or mode
                    --         return string.format("%%#LualineModeBar#▎%%#LualineModeText# %s", mode_name)
                    --         -- return string.format("%%#LualineModeBar#|%%#LualineModeText# %s", mode_name)
                    --     end,
                    --     color = {}, -- Disable lualine's auto-coloring so we can use highlights
                    -- },

                    {
                        function()
                            local mode_map = {
                                n = "NORMAL",
                                i = "INSERT",
                                v = "VISUAL",
                                V = "V-LINE",
                                [""] = "V-BLOCK",
                                c = "COMMAND",
                                R = "REPLACE",
                                t = "TERMINAL",
                            }

                            local mode = vim.fn.mode()
                            return mode_map[mode] or mode
                        end,
                        -- color = { fg = "#ffffff", bg = "#1e1e1e" },
                        color = { fg = "#a0a0a0", bg = "#1e1e1e" },
                        --
                    },
                    {
                        "filename",
                        -- "buffers",
                        symbols = {
                            modified = "✦",
                            alternate_file = "",
                            directory = "",
                        },
                        path = 1,             -- 0: Just filename, 1: Relative path, 2: Absolute path
                        shorting_target = 40, -- Shorten if too long
                        show_filename_only = false,
                        hide_filename_extension = true,
                        show_modified_status = true,
                        -- buffers_color = {
                        --     active = { fg = "#ffffff", bg = bgColor },
                        --     inactive = { fg = "#505050", bg = bgColor },
                        -- },

                        -- color = { fg = "#a7a7a7", bg = "#171717" },
                        -- color = { fg = "#a1a1a1", bg = "#111111" }
                        -- color = { fg = "#ffffff", bg = "#0c0c0c" }
                        -- color = { fg = "#a0a0a0", bg = "#0c0c0c" }
                        -- color = { fg = "#eeeeee", bg = "#0c0c0c" }
                        -- color = { fg = "#eeeeee", bg = "#111111" }
                        color = { fg = "#a0a0a0", bg = "#111111" }
                    },
                },
                lualine_b = {
                    -- {
                    --     "diagnostics",
                    -- },
                },
                lualine_c = {},
                lualine_x = {

                    -- {
                    --     get_harpoon_marks,
                    --     color = { fg = "#888888", bg = bgColor },
                    -- },
                },
                lualine_y = {
                    -- {
                    --     "macro-recording",
                    --     fmt = function()
                    --         local recording_register = vim.fn.reg_recording()
                    --         if recording_register == "" then
                    --             return ""
                    --         else
                    --             return "Recording @" .. recording_register
                    --         end
                    --     end,
                    --     color = { fg = "#aaaaaa", bg = bgColor }, -- Red color to make it noticeable
                    -- },
                    {
                        "branch",
                        separator = " ",
                        color = { fg = "#505050", bg = bgColor },
                        icon = { "󰘬", align = "left", color = { fg = "#505050" } },
                        -- icon = { "", align = "left", color = { fg = "#505050" } },
                    },
                },
                lualine_z = {
                    {
                        function()
                            local result = {}
                            for i = 1, vim.fn.tabpagenr("$") do
                                local name = get_tab_name(i)
                                if i == vim.fn.tabpagenr() then
                                    table.insert(result, "%#LualineTabActive#" .. name)
                                else
                                    table.insert(result, "%#LualineTabInactive#" .. name)
                                end
                            end
                            return table.concat(result, " ")
                        end,
                    },
                    -- {
                    --     "progress",
                    --     color = { fg = "#505050", bg = bgColor },
                    -- },

                    -- {
                    --     require('fleet').lualine_component,
                    -- },
                    -- {
                    --     get_active_harpoon_list,
                    --     color = { fg = "#505050", bg = bgColor }, -- Green color for the Harpoon list
                    -- },
                    -- {
                    --     function()
                    --         return require("lsp-progress").progress()
                    --     end,
                    --     color = { fg = "#505050" },
                    -- }
                },
            },
            -- tabline = {
            --     lualine_a = {
            --         {
            --             "buffers",
            --             symbols = {
            --                 modified = "✦",
            --                 alternate_file = "",
            --                 directory = "",
            --             },
            --             show_filename_only = true,
            --             hide_filename_extension = false,
            --             show_modified_status = true,
            --             mode = 0, -- 0: buffer name, 1: buffer index
            --             max_length = vim.o.columns,
            --             buffers_color = {
            --                 active = { fg = "#ffffff", bg = "#111111" },
            --                 inactive = { fg = "#505050", bg = "#060606" },
            --             },
            --         },
            --     },
            --     lualine_b = {},
            --     lualine_c = {},
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = {},
            -- },
            extensions = {},
        })

        vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
        vim.api.nvim_create_autocmd("User", {
            group = "lualine_augroup",
            pattern = "LspProgressStatusUpdated",
            callback = require("lualine").refresh,
        })

        -- Create highlight groups for tabs
        -- vim.cmd([[
        --     highlight LualineTabActive guifg=#a0a0a0 guibg=none
        --     highlight LualineTabInactive guifg=#505050 guibg=none
        --     highlight LualineSeparator guifg=#0e0e0e guibg=none
        --     highlight LualineBranch guifg=#808080 guibg=none
        -- ]])

        -- vim.cmd([[
        --     highlight LualineTabActive guifg=#a7a7a7 guibg=#090909
        --     highlight LualineTabInactive guifg=#505050 guibg=#090909
        --     highlight LualineSeparator guifg=#0e0e0e guibg=#090909
        --     highlight LualineBranch guifg=#808080 guibg=#090909
        -- ]])


        vim.cmd([[
            highlight LualineTabActive guifg=#a7a7a7 guibg=#060606
            highlight LualineTabInactive guifg=#505050 guibg=#060606
            highlight LualineSeparator guifg=#0e0e0e guibg=#060606
            highlight LualineBranch guifg=#808080 guibg=#060606
        ]])
    end,

}
