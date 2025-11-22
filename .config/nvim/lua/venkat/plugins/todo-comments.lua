return {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local todo_comments = require("todo-comments")
        local colors = {
            error = "#e67e7e",
            warning = "#d2a374",
            info = "#5f9ea0",
            hint = "#7ca68c",
            default = "#70787f",
            grey = "#505050",
            white = "#eeeeee",
        }

        todo_comments.setup({
            signs = true,
            highlight = {
                before = "",
                keyword = "fg",
                after = "",
                pattern = [[.*<(KEYWORDS)\s*:]],
            },
            gui_style = {
                fg = "NONE",
                bg = "NONE",
            },
            keywords = {
                DONE = { icon = "", color = colors.hint, alt = { "COMPLETE", "FINISHED" } },
                FIX = { icon = "", color = colors.error, alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
                TODO = { icon = "", color = colors.warning },
                HACK = { icon = "", color = colors.info },
                WARN = { icon = "", color = colors.error, alt = { "WARNING", "XXX" } },
                PERF = { icon = "", color = colors.hint, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = "->", color = colors.white, alt = { "INFO", "info" } },

                -- ✅ Fixed: no spaces in key
                TIMECOMPLEXICITY = {
                    color = "#888888",
                    alt = { "TIME COMPLEXICITY", "TIME COMPLEXITY" },
                },

                SPACECOMPLEXICITY = {
                    color = "#888888",
                    alt = { "SPACE COMPLEXICITY", "SPACE COMPLEXITY" },
                },
            },
        })

        -- NOTE highlight
        vim.api.nvim_set_hl(0, "TodoSignNOTE", { fg = "#505050", bg = "NONE" })
        vim.api.nvim_set_hl(0, "TodoBgNOTE", { fg = "#eeeeee", bg = "NONE" })
        vim.api.nvim_set_hl(0, "TodoFgNOTE", { fg = "#eeeeee", bg = "NONE" })

        -- TODO highlight
        vim.api.nvim_set_hl(0, "TodoSignTODO", { fg = "#505050", bg = "NONE" })
        vim.api.nvim_set_hl(0, "TodoBgTODO", { fg = "#eeeeee", bg = "NONE" })
        vim.api.nvim_set_hl(0, "TodoFgTODO", { fg = "#eeeeee", bg = "NONE" })

        -- ✅ TIME COMPLEXICITY highlight
        vim.api.nvim_set_hl(0, "TodoSignTIMECOMPLEXICITY", { fg = "#505050", bg = "NONE" })
        vim.api.nvim_set_hl(0, "TodoBgTIMECOMPLEXICITY", { fg = "#888888", bg = "NONE" })
        vim.api.nvim_set_hl(0, "TodoFgTIMECOMPLEXICITY", { fg = "#888888", bg = "NONE" })

        vim.api.nvim_set_hl(0, "TodoSignSPACECOMPLEXICITY", { fg = "#505050", bg = "NONE" })
        vim.api.nvim_set_hl(0, "TodoBgSPACECOMPLEXICITY", { fg = "#888888", bg = "NONE" })
        vim.api.nvim_set_hl(0, "TodoFgSPACECOMPLEXICITY", { fg = "#888888", bg = "NONE" })
    end,
}
