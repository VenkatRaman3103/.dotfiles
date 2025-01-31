return {
    "mbbill/undotree",
    config = function()
        vim.keymap.set("n", "<leader>uo", "<cmd>UndotreeToggle<CR>")
    end,
}
