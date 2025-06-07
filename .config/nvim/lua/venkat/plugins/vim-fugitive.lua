return {
    "tpope/vim-fugitive",
    config = function()
        local keymap = vim.keymap.set

        keymap('n', '<leader>gs', function()
            vim.cmd('tabnew')
            vim.cmd('Git')
            vim.cmd('only')
        end, { desc = 'Git status in new tab' })

        keymap('n', '<leader>go', function()
            vim.cmd('tabnew')
            vim.cmd('Git')
            vim.cmd('only')
        end, { desc = 'Git status in new tab' })

        keymap('n', '<leader>ga', ':Git add .<CR>', { desc = 'Git add all files' })

        keymap('n', '<leader>gc', function()
            vim.cmd('tabnew')
            vim.cmd('Git commit')
            vim.cmd('only')
        end, { desc = 'Git commit in new tab' })

        keymap('n', '<leader>gd', function()
            vim.cmd('tabnew')
            vim.cmd('Git show')
        end, { desc = 'Git diff in new tab' })

        keymap('n', '<leader>gl', function()
            vim.cmd('tabnew')
            vim.cmd('Git log --oneline')
            vim.cmd('only')
        end, { desc = 'Git log in new tab' })

        keymap('n', '<leader>gb', function()
            vim.cmd('Git blame')
        end, { desc = 'Git blame in new tab' })

        keymap('n', '<leader>gp', function()
            vim.cmd('tabnew')
            vim.cmd('Git push')
            vim.cmd('only')
        end, { desc = 'Git push in new tab' })

        keymap('n', '<leader>gP', function()
            vim.cmd('tabnew')
            vim.cmd('Git pull')
            vim.cmd('only')
        end, { desc = 'Git pull in new tab' })
    end
}
