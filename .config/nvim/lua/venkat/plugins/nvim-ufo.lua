return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
        -- Global fold options
        vim.o.foldcolumn = "1" -- Show fold column, '0' disables it
        vim.o.foldlevel = 99 -- Start with all folds open
        vim.o.foldlevelstart = 99 -- Ensure folds are open on startup
        vim.o.foldenable = true -- Enable folding by default
        vim.o.foldmethod = "manual" -- Use manual folds for zf to work

        -- Remove background color for folded lines and the ellipsis (three dots)
        vim.cmd([[
            highlight UfoFoldedFg guifg=Normal.foreground 
            highlight UfoFoldedBg guibg=NONE             
            highlight UfoFoldedEllipsis guifg=Normal.foreground guibg=NONE 
            highlight FoldColumn guibg=NONE            
            highlight FoldColumn gui=bold 
            highlight Folded guibg=NONE               
        ]])

        -- Keymaps for toggling folds
        vim.keymap.set("n", "zR", require("ufo").openAllFolds)
        vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

        -- Basic setup for ufo
        require("ufo").setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { "treesitter", "indent" } -- Use Tree-sitter and indent providers
            end,
        })
    end,
}
