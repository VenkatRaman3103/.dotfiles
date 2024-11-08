return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
        "ibhagwan/fzf-lua",
        "echasnovski/mini.pick",
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
                section = { "▶", "▼" }, -- Custom triangle icons for expanding and collapsing
                item = { "▷", "▼" },
                hunk = { "", "" },
            },
            mappings = {
                status = {
                    ["<tab>"] = "Toggle", -- Adds easier navigation with Tab key
                    ["<space>"] = "Stage",
                    ["s"] = "Stage",
                    ["u"] = "Unstage",
                    ["r"] = "RefreshBuffer", -- Refresh status buffer
                },
            },
        })

        keymap.set("n", "<leader>ng", "<cmd>Neogit<CR>")
    end,
}
