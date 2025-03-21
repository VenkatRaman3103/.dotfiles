return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local bgColor = ""

        -- Create global table for storing tab names
        _G.custom_tab_names = _G.custom_tab_names or {}

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
                global_status = false, -- Move lualine to the top
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
                        path = 1, -- 0: Just filename, 1: Relative path, 2: Absolute path
                        shorting_target = 40, -- Shorten if too long
                        show_filename_only = false,
                        hide_filename_extension = true,
                        show_modified_status = true,
                        buffers_color = {
                            active = { fg = "#ffffff", bg = bgColor },
                            inactive = { fg = "#505050", bg = bgColor },
                        },
                    },
                },
                lualine_b = {
                    -- {
                    --     "diagnostics",
                    --     color = { fg = "#505050", bg = bgColor },
                    -- },
                },
                lualine_c = {},
                lualine_x = {},
                lualine_y = {
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
                },
                lualine_z = {
                    {
                        "branch",
                        color = { fg = "#505050", bg = bgColor },
                        icon = { "󰘬", align = "left", color = { fg = "#505050" } },
                    },
                },
            },
            extensions = {},
        })

        -- Move lualine to the top
        -- vim.o.showtabline = 2
        -- vim.o.laststatus = 3 -- Ensures statusline is always shown at the top

        -- Create highlight groups for tabs
        vim.cmd([[
            highlight LualineTabActive guifg=#ffffff guibg=NONE
            highlight LualineTabInactive guifg=#505050 guibg=NONE
            highlight LualineSeparator guifg=#0e0e0e guibg=NONE
            highlight LualineBranch guifg=#808080 guibg=NONE
        ]])
    end,
}
