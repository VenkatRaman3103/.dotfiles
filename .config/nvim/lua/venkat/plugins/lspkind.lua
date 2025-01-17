return {
    "onsails/lspkind-nvim", -- Add lspkind-nvim for LSP item kind icons
    config = function()
        require("lspkind").init({
            -- Customize lspkind configuration here if needed
        })
    end,
}
