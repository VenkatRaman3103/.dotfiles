return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local keymap = vim.keymap
        local util = require("lspconfig/util")

        -- Keep your keymapping setup
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Your keymappings remain the same
                local opts = { buffer = ev.buf, silent = true }
                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts)

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
            end,
        })

        local capabilities = cmp_nvim_lsp.default_capabilities()

        local signs = { Error = "", Warn = "", Hint = "", Info = "" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- Use correct server name: ts_ls instead of tsserver
        mason_lspconfig.setup({
            ensure_installed = {
                "html",
                "cssls",
                "tailwindcss",
                "svelte",
                "lua_ls",
                "graphql",
                "emmet_ls",
                "prismals",
                "pyright",
                "ts_ls", -- Correct name for TypeScript server in your setup
                -- "rust_analyzer",
            },
        })

        -- Configure file type associations explicitly
        vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
            pattern = "*.tsx",
            callback = function()
                vim.bo.filetype = "typescriptreact"
            end,
        })

        mason_lspconfig.setup_handlers({
            -- Default handler
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,

            -- Server-specific configurations
            ["cssls"] = function()
                lspconfig["cssls"].setup({
                    capabilities = capabilities,
                    settings = {
                        css = { validate = true },
                        scss = { validate = true },
                        less = { validate = true },
                    },
                })
            end,

            ["graphql"] = function()
                lspconfig["graphql"].setup({
                    capabilities = capabilities,
                    filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
                })
            end,

            ["emmet_ls"] = function()
                lspconfig["emmet_ls"].setup({
                    capabilities = capabilities,
                    filetypes = {
                        "html",
                        "typescriptreact",
                        "javascriptreact",
                        "css",
                        "sass",
                        "scss",
                        "less",
                        "svelte",
                    },
                })
            end,

            ["lua_ls"] = function()
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = { globals = { "vim" } },
                            completion = { callSnippet = "Replace" },
                        },
                    },
                })
            end,

            -- ["rust_analyzer"] = function()
            --     lspconfig["rust_analyzer"].setup({
            --         capabilities = capabilities,
            --         cmd = { "rust-analyzer" },
            --         filetypes = { "rust" },
            --         -- Extremely simplified settings to identify if specific features are causing issues
            --         settings = {
            --             ["rust-analyzer"] = {
            --                 cargo = {
            --                     allFeatures = false, -- Reduce features
            --                     loadOutDirsFromCheck = false, -- Disable loading out dirs
            --                 },
            --                 checkOnSave = { enable = false }, -- Disable background checking
            --                 procMacro = { enable = false }, -- Disable proc macros
            --                 diagnostics = { disabled = { "*" } }, -- Disable all diagnostics
            --                 inlayHints = { enable = false }, -- Disable inlay hints
            --                 hover = { actions = { enable = false } }, -- Simplify hover
            --                 completion = { autoimport = { enable = false } }, -- Disable autoimport
            --             },
            --         },
            --         flags = {
            --             debounce_text_changes = 500, -- Increase debounce time
            --             allow_incremental_sync = false, -- Force full document sync
            --         },
            --     })
            -- end,
            ["ts_ls"] = function()
                lspconfig["ts_ls"].setup({
                    capabilities = capabilities,
                    filetypes = {
                        "typescript",
                        "typescriptreact",
                        "typescript.tsx",
                        "javascript",
                        "javascriptreact",
                    },
                    root_dir = function(fname)
                        return require("lspconfig.util").root_pattern("tsconfig.json", "jsconfig.json", "package.json")(
                            fname
                        ) or vim.fn.getcwd()
                    end,
                    init_options = {
                        preferences = {
                            includeInlayParameterNameHints = "none",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = false,
                            includeInlayVariableTypeHints = false,
                            includeInlayPropertyDeclarationTypeHints = false,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = false,
                        },
                    },
                    settings = {
                        typescript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "none",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                includeInlayFunctionParameterTypeHints = false,
                                includeInlayVariableTypeHints = false,
                                includeInlayPropertyDeclarationTypeHints = false,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = false,
                            },
                        },
                        javascript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "none",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                includeInlayFunctionParameterTypeHints = false,
                                includeInlayVariableTypeHints = false,
                                includeInlayPropertyDeclarationTypeHints = false,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = false,
                            },
                        },
                    },
                })
            end,
        })
    end,
}
