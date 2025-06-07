return {
    "tpope/vim-fugitive",
    config = function()
        -- Configure vim-fugitive to open in tabs instead of splits
        local keymap = vim.keymap.set

        -- Open Git status in new tab (full window)
        keymap('n', '<leader>gs', function()
            vim.cmd('tabnew')
            vim.cmd('Git')
            vim.cmd('only') -- Close any splits, keep only current window
        end, { desc = 'Git status in new tab' })

        -- Alternative Git status mapping
        keymap('n', '<leader>go', function()
            vim.cmd('tabnew')
            vim.cmd('Git')
            vim.cmd('only')
        end, { desc = 'Git status in new tab' })

        -- Git add all (note: this won't show output, just executes)
        keymap('n', '<leader>ga', ':Git add .<CR>', { desc = 'Git add all files' })

        -- Git commit in new tab
        keymap('n', '<leader>gc', function()
            vim.cmd('tabnew')
            vim.cmd('Git commit')
            vim.cmd('only')
        end, { desc = 'Git commit in new tab' })

        -- Git diff in new tab (use Gvdiffsplit for side-by-side or Git show for single pane)
        keymap('n', '<leader>gd', function()
            vim.cmd('tabnew')
            vim.cmd('Git show') -- Shows diff in single pane instead of split
        end, { desc = 'Git diff in new tab' })

        -- Git log in new tab
        keymap('n', '<leader>gl', function()
            vim.cmd('tabnew')
            vim.cmd('Git log --oneline')
            vim.cmd('only')
        end, { desc = 'Git log in new tab' })

        -- Git blame in new tab
        keymap('n', '<leader>gb', function()
            vim.cmd('tabnew')
            vim.cmd('Git blame')
            vim.cmd('only')
        end, { desc = 'Git blame in new tab' })

        -- Additional useful mappings
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
