return {
    {
        "echasnovski/mini.nvim",
        version = "*",
        config = function()
            require("mini.files").setup({
                -- No need to copy this inside `setup()`. Will be used automatically.
                content = {
                    filter = nil,
                    highlight = nil,
                    prefix = nil,
                    sort = nil,
                },

                mappings = {
                    close       = 'q',
                    go_in       = 'L',
                    -- go_in_plus  = 'L',
                    go_out      = 'H',
                    -- go_out_plus = 'H',
                    mark_goto   = "'",
                    mark_set    = 'm',
                    reset       = '<BS>',
                    reveal_cwd  = '@',
                    show_help   = 'g?',
                    synchronize = '=',
                    trim_left   = '<',
                    trim_right  = '>',
                },

                options = {
                    permanent_delete = true,
                    use_as_default_explorer = false,
                },

                windows = {
                    max_number = math.huge,
                    preview = false,
                    width_focus = 50,
                    width_nofocus = 15,
                    width_preview = 25,
                },
            })

            vim.keymap.set("n", "<leader>mo", function()
                require("mini.files").open()
            end, { desc = "Open Mini Files" })
        end,
    },
}
