-- mason.lua
return {
    "williamboman/mason.nvim",
    config = function()
        -- Only set up basic mason functionality
        require("mason").setup({
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })
    end,
}
