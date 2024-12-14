return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = {
                    normal = {
                        a = { fg = "#ffffff", bg = "#111111" },
                        b = { fg = "#ffffff", bg = "#111111" },
                        c = { fg = "#ffffff", bg = "#111111" },
                    },
                    insert = { a = { fg = "#ffffff", bg = "#111111" } },
                    visual = { a = { fg = "#ffffff", bg = "#111111" } },
                    replace = { a = { fg = "#ffffff", bg = "#111111" } },
                    command = { a = { fg = "#ffffff", bg = "#111111" } },
                },
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                global_status = true,
            },
            sections = {
                lualine_a = {},
                lualine_b = {
                    {
                        "buffers",
                        symbols = {
                            modified = " ✦",
                            alternate_file = "",
                            directory = "",
                        },
                        show_filename_only = true,
                        hide_filename_extension = false,
                        show_modified_status = true,
                        buffers_color = {
                            active = { fg = "#ffffff", bg = "#111111" }, -- Active buffer: white foreground
                            inactive = { fg = "#505050", bg = "#111111" }, -- Inactive buffer: gray foreground
                        },
                    },
                },
                lualine_c = {},
                lualine_x = {
                    {
                        "diff",
                    },
                },
                lualine_y = {},
                lualine_z = {
                    {
                        "branch",
                        color = { fg = "#808080", bg = "#111111" }, -- Grey foreground
                    },
                },
            },
            extensions = {},
        })

        -- Additional highlights for separators or specific components
        vim.cmd([[highlight LualineSeparator guifg=#0e0e0e guibg=NONE]])
        vim.cmd([[highlight LualineBranch guifg=#808080 guibg=NONE]])
    end,
}
