return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                cmd = { "typescript-language-server", "--stdio" },
                filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
                root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
            })

            lspconfig.pyright.setup({
                capabilities = capabilities,
                filetypes = { "python" },
                root_dir = lspconfig.util.root_pattern("pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git"),
            })

            lspconfig.cssls.setup({
                capabilities = capabilities,
                filetypes = { "css", "scss", "less" },
                root_dir = lspconfig.util.root_pattern("package.json", ".git"),
            })

            lspconfig.clangd.setup({
                capabilities = capabilities,
                cmd = { "clangd" },
                filetypes = { "c", "cpp", "objc", "objcpp" },
                root_dir = lspconfig.util.root_pattern("compile_commands.json", ".clangd", ".git"),
            })

            lspconfig.csharp_ls.setup({
                capabilities = capabilities,
                cmd = { "csharp-ls" },
                filetypes = { "cs" },
                root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
            })
        end,
    },
}
