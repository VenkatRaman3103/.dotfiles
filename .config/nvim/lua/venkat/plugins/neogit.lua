return {
    "NeogitOrg/neogit",
    branch = "nightly",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local neogit = require("neogit")

        neogit.setup({
            -- Minimal configuration to avoid conflicts
            integrations = {
                diffview = true,
                telescope = true,
            },
        })

        -- Simple keymap
        vim.keymap.set("n", "<leader>go", neogit.open, { silent = true, noremap = true })
    end,
}
