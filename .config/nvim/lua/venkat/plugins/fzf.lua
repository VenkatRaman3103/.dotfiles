return {
    {
        "junegunn/fzf.vim",
        dependencies = { "junegunn/fzf", build = "./install --bin" },
        config = function()
            -- Set fzf to open in a split window
            vim.g.fzf_layout = {
                window = {
                    width = 0.9,
                    height = 0.6,
                    border = "none" -- Remove the border completely
                }
            }

            -- Remove borders and set background color
            vim.g.fzf_colors = {
                bg = { 'bg', '#090909' },
                ['bg+'] = { 'bg', '#090909' },
                border = { 'fg', '#090909' }, -- Make borders same as background
            }
        end,
    },
}

