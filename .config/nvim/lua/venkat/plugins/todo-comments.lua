return {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local todo_comments = require("todo-comments")

        -- Define muted colors
        local colors = {
            error = "#e67e7e",   -- Soft salmon
            warning = "#d2a374", -- Warm coral
            info = "#5f9ea0",    -- Muted teal
            hint = "#7ca68c",    -- Sage green
            default = "#70787f", -- Ocean gray
            grey = "#505050",
        }

        todo_comments.setup({
            signs = true,    -- Show icons in the sign column
            highlight = {
                before = "", -- "fg" or "bg" or empty
                keyword = "fg",
                after = "fg",
                pattern = [[.*<(KEYWORDS)\s*:]], -- Match TODO, FIXME, etc.

            },

            keywords = {
                DONE = { icon = "", color = colors.hint, alt = { "COMPLETE", "FINISHED" } },
                FIX = { icon = "", color = colors.error, alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
                TODO = { icon = "", color = colors.grey },
                HACK = { icon = "", color = colors.info },
                WARN = { icon = "", color = colors.error, alt = { "WARNING", "XXX" } },
                PERF = { icon = "", color = colors.hint, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = "", color = colors.warning, alt = { "INFO", "note" } },
                note = { icon = "", color = colors.warning, alt = { "note" } },

            },
            -- keywords = {
            --     DONE = { icon = "✔ ", color = colors.hint, alt = { "COMPLETE", "FINISHED" } },
            --     FIX = { icon = " ", color = colors.error, alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
            --     TODO = { icon = " ", color = colors.grey },
            --     HACK = { icon = " ", color = colors.info },
            --     WARN = { icon = " ", color = colors.error, alt = { "WARNING", "XXX" } },
            --     PERF = { icon = " ", color = colors.hint, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            --     NOTE = { icon = " ", color = colors.warning, alt = { "INFO" } },
            --
            -- },
        })
    end,
}
