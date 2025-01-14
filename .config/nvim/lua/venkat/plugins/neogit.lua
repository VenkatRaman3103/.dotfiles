return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
        "ibhagwan/fzf-lua",
        "echasnovski/mini.pick",
        "isakbm/gitgraph.nvim",
    },
    config = function()
        local neogit = require("neogit")
        local keymap = vim.keymap

        neogit.setup({
            integrations = {
                diffview = true,
                telescope = true,
            },
            signs = {
                section = { "▶", "▼" },
                item = { "○", "●" },
                hunk = { "", "" },
            },
            -- graph_style = "kitty",
            mappings = {
                -- These are the valid commands from the error message
                status = {
                    ["<tab>"] = "Toggle",
                    ["<space>"] = "Stage",
                    ["s"] = "Stage",
                    ["u"] = "Unstage",
                    -- ["r"] = "RefreshBuffer",
                    -- ["c"] = "Command",
                    ["S"] = "StageAll",
                },
            },
            -- Add this to customize the command behavior
            commands = {
                -- Customize the commit command
                commit = {
                    type = "split",
                },
            },
        })

        keymap.set("n", "<leader>ng", "<cmd>Neogit<CR>")
    end,
}
