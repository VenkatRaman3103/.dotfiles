return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local bgColor = ""
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
                global_status = true,
            },
            sections = {
                lualine_a = {
                    {
                        "filename",
                        -- icon = { "▎", align = "left", color = { fg = "#3aa8e3" } }, -- Changed icon
                        symbols = {
                            modified = "✦",
                            alternate_file = "",
                            directory = "",
                        },
                        show_filename_only = true,
                        hide_filename_extension = true,
                        show_modified_status = true,
                        buffers_color = {
                            active = { fg = "#ffffff", bg = bgColor },
                            inactive = { fg = "#505050", bg = bgColor },
                        },
                    },
                },
                lualine_b = {},
                lualine_c = {
                    "diagnostics",
                },
                lualine_x = {},
                lualine_y = {
                    {
                        "diff",
                        color = { fg = "#505050", bg = bgColor },
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
        vim.cmd([[highlight LualineSeparator guifg=#0e0e0e guibg=NONE]])
        vim.cmd([[highlight LualineBranch guifg=#808080 guibg=NONE]])
    end,
}
