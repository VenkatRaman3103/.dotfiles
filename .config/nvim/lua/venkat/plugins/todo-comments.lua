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
        }
        todo_comments.setup({
            signs = false,
            highlight = {
                before = "",
                keyword = "fg",
                after = "",
                pattern = [[.*<(KEYWORDS)\s*:]],
            },
            keywords = {
                DONE = { icon = "", color = colors.hint, alt = { "COMPLETE", "FINISHED" } },
                FIX = { icon = "", color = colors.error, alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
                TODO = { icon = "", color = colors.warning },
                HACK = { icon = "", color = colors.info },
                WARN = { icon = "", color = colors.error, alt = { "WARNING", "XXX" } },
                PERF = { icon = "", color = colors.hint, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = "", color = colors.info, alt = { "INFO", "info" } },
            },
        })
    end,
}
