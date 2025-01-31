return {
    {
        "junegunn/fzf.vim",
        dependencies = { "junegunn/fzf", build = "./install --bin" },
        config = function()
            -- Set fzf to open in a split window
            -- vim.g.fzf_layout = { down = "~40%" } -- Horizontal split using 40% of the screen
        end,
    },
}
