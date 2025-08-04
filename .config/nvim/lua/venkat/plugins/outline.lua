return {
    "hedyhli/outline.nvim",
    config = function()
        vim.keymap.set("n", "<leader>to", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

        require("outline").setup({
            -- Your setup opts here
        })

        -- Customize outline highlight groups
    end,
}
