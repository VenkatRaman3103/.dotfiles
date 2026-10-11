return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
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

        require("mason-lspconfig").setup({
            ensure_installed = {
                "cssls",
                "html",
                "jsonls",
                "yamlls",
                "ts_ls",
                "pyright",
                "clangd",
                "csharp_ls",
                "rust_analyzer",
            },
            automatic_installation = true,
        })
    end,
}
