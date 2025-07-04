return {
    "tpope/vim-fugitive",
    config = function()
        -- Configure vim-fugitive to open in tabs instead of splits
        local keymap = vim.keymap.set
        -- keymap('n', '<leader>gs', ':Git status<CR>', { desc = 'Git status' })
        -- keymap('n', '<leader>go', ':Git<CR>', { desc = 'Git status' })
        -- keymap('n', '<leader>ga', ':Git add .<CR>', { desc = 'Git status' })
        -- keymap('n', '<leader>gc', ':Git commit<CR>', { desc = 'Git commit' })
        -- keymap('n', '<leader>gd', ':Gdiff<CR>', { desc = 'Git diff' })
        -- keymap('n', '<leader>gl', ':Git log<CR>', { desc = 'Git log' })
        -- keymap('n', '<leader>gb', ':Git blame<CR>', { desc = 'Git blame' })
    end
}
