return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- Defer the setup for oil.nvim to avoid automatic opening at startup
    event = "VeryLazy", -- Load oil.nvim lazily
    config = function()
        local oil = require("oil")
        oil.setup({
            -- Customize the floating window to be smaller and remove background
            float = {
                max_width = 80, -- Set maximum width for the floating window
                max_height = 25, -- Set maximum height for the floating window
                border = "rounded", -- Optional: Add rounded borders to the window
                win_options = {
                    winblend = 0, -- No blending (transparency)
                    -- Remove background by setting Normal highlight
                    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
                },
            },
        })

        -- Set up a keymap to open Oil in a floating window
        vim.keymap.set("n", "<leader>o", function()
            oil.open_float()
        end, { desc = "Open floating file explorer with Oil" })
    end,
}
