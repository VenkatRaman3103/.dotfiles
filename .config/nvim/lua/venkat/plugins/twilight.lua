return {
    "folke/twilight.nvim",
    keys = {
        -- Toggle twilight
        { "<leader>tf", "<cmd>TwilightDisable<cr>", desc = "Disable Twilight" },
        { "<leader>to", "<cmd>TwilightEnable<cr>", desc = "Enable Twilight" },
        -- Extend highlight scope
        {
            "<leader>te",
            function()
                local twilight = require("twilight")
                -- Increment context by 5 lines each time
                twilight.setup({
                    context = twilight.state.context + 5,
                })
                -- Refresh the highlighting
                twilight.refresh()
            end,
            desc = "Extend Twilight scope",
        },
        -- Reset highlight scope
        {
            "<leader>tr",
            function()
                local twilight = require("twilight")
                -- Reset to default context
                twilight.setup({
                    context = 10,
                })
                -- Refresh the highlighting
                twilight.refresh()
            end,
            desc = "Reset Twilight scope",
        },
    },
    opts = {
        dimming = {
            alpha = 0.25,
            color = { "Normal", "#ffffff" },
            term_bg = "#0e0e0e",
            inactive = false,
        },
        context = 10,
        treesitter = true,
        expand = {
            "function",
            "method",
            "table",
            "if_statement",
            -- Add more types to expand the scope for functional programming
            "arrow_function",
            "call_expression",
            "return_statement",
            "variable_declaration",
        },
        exclude = {
            -- Add any filetypes you want to exclude
        },
    },
}
