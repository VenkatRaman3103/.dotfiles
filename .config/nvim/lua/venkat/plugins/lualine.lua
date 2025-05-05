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

        -- Function to get active Harpoon list name
        local function get_active_harpoon_list()
            if _G.active_harpoon_list then
                local parts = split(_G.active_harpoon_list, ':') -- Splitting the string
                local folder_part = parts[1]                     -- First part (before ':')
                local list_part = parts[2]                       -- Second part (after ':')

                return list_part or
                    "" -- Return list_part if it exists, otherwise return an empty string
            else
                return ""
            end
        end


        -- Create the command for tab renaming
        vim.api.nvim_create_user_command("RenameTab", rename_tab, {})

        require("lualine").setup({
            options = {
                theme = {
                    normal = {
                        a = { fg = "#ffffff", bg = bgColor },
                        b = { fg = "#ffffff", bg = bgColor },
                        c = { fg = "#ffffff", bg = bgColor },
                    },
                    insert = { a = { fg = "#ffffff", bg = bgColor } },
                    visual = { a = { fg = "#ffffff", bg = bgColor } },
                    replace = { a = { fg = "#ffffff", bg = bgColor } },
                    command = { a = { fg = "#ffffff", bg = bgColor } },
                },
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                global_status = false,
                always_divide_middle = true,
            },
            sections = {
                lualine_a = {
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
                        color = { fg = "#a0a0a0", bg = "#0c0c0c" }


                    },
                },
                lualine_b = {
                    -- {
                    --     "diagnostics",
                    -- },
                },
                lualine_c = {},
                lualine_x = {
                },
                lualine_y = {
                    {
                        "macro-recording",
                        fmt = function()
                            local recording_register = vim.fn.reg_recording()
                            if recording_register == "" then
                                return ""
                            else
                                return "Recording @" .. recording_register
                            end
                        end,
                        color = { fg = "#aaaaaa", bg = bgColor }, -- Red color to make it noticeable
                    },
                    -- {
                    --     get_active_harpoon_list,
                    --     color = { fg = "#505050", bg = bgColor }, -- Green color for the Harpoon list
                    -- },

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

                    {
                        "branch",
                        color = { fg = "#505050", bg = bgColor },
                        icon = { "󰘬", align = "left", color = { fg = "#505050" } },
                    },

                },
            },
            extensions = {},
        })

        -- Create highlight groups for tabs
        -- vim.cmd([[
        --     highlight LualineTabActive guifg=#a7a7a7 guibg=#111111
        --     highlight LualineTabInactive guifg=#505050 guibg=#111111
        --     highlight LualineSeparator guifg=#0e0e0e guibg=#111111
        --     highlight LualineBranch guifg=#808080 guibg=#111111
        -- ]])

        vim.cmd([[
            highlight LualineTabActive guifg=#a7a7a7 guibg=none
            highlight LualineTabInactive guifg=#505050 guibg=none
            highlight LualineSeparator guifg=#0e0e0e guibg=none
            highlight LualineBranch guifg=#808080 guibg=none
        ]])
    end,
}
