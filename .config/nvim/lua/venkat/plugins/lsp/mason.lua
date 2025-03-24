return {
    {
        "williamboman/mason.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("mason").setup({
                ui = {
                    check_outdated_packages_on_open = false,
                    border = "rounded",
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
                max_concurrent_installers = 4, -- Increased from 1 for faster installations
                log_level = vim.log.levels.INFO,
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        event = "VeryLazy",
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = {
                    -- Web Development
                    "html",
                    "cssls",
                    "tailwindcss",
                    "emmet_ls",
                    "ts_ls", -- Changed from tsserver to match your other config
                    "eslint",
                    "svelte",
                    "prismals",
                    "graphql",
                    "jsonls",
                    "cssmodules_ls",
                    "dockerls",
                    -- Systems Programming
                    "clangd", -- C/C++
                    -- "rust_analyzer", -- Rust
                    -- Python Development
                    "pyright", -- Static type checker
                    -- "ruff_lsp", -- Uncomment for Python linting
                    -- Database
                    "sqlls",
                    -- General
                    "lua_ls",
                },
            })
            local lspconfig = require("lspconfig")
            mason_lspconfig.setup_handlers({
                function(server_name)
                    local opts = {
                        capabilities = require("cmp_nvim_lsp").default_capabilities(),
                    }
                    -- Specific server configurations
                    if server_name == "clangd" then
                        opts.cmd = {
                            "clangd",
                            "--background-index",
                            "--suggest-missing-includes",
                            "--clang-tidy",
                            "--header-insertion=iwyu",
                        }
                    -- elseif server_name == "rust_analyzer" then
                    --     opts.settings = {
                    --         ["rust-analyzer"] = {
                    --             cargo = {
                    --                 allFeatures = true,
                    --                 loadOutDirsFromCheck = true,
                    --             },
                    --             checkOnSave = {
                    --                 command = "clippy",
                    --             },
                    --             procMacro = {
                    --                 enable = true,
                    --             },
                    --             diagnostics = {
                    --                 disabled = { "unresolved-proc-macro" },
                    --                 enableExperimental = false,
                    --             },
                    --         },
                    --     }
                    --     opts.init_options = {
                    --         procMacroServer = { enable = true },
                    --         cargo = { loadOutDirsFromCheck = true },
                    --     }
                    elseif server_name == "pyright" then
                        opts.settings = {
                            python = {
                                analysis = {
                                    typeCheckingMode = "basic",
                                    autoSearchPaths = true,
                                    useLibraryCodeForTypes = true,
                                },
                            },
                        }
                    elseif server_name == "lua_ls" then
                        opts.settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                completion = {
                                    callSnippet = "Replace",
                                },
                            },
                        }
                    elseif server_name == "ts_ls" then
                        opts.filetypes = {
                            "typescript",
                            "typescriptreact",
                            "typescript.tsx",
                            "javascript",
                            "javascriptreact",
                        }
                        opts.root_dir = function(fname)
                            return require("lspconfig.util").root_pattern(
                                "tsconfig.json",
                                "jsconfig.json",
                                "package.json"
                            )(fname) or vim.fn.getcwd()
                        end
                        opts.init_options = {
                            preferences = {
                                includeInlayParameterNameHints = "none",
                                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                includeInlayFunctionParameterTypeHints = false,
                                includeInlayVariableTypeHints = false,
                                includeInlayPropertyDeclarationTypeHints = false,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = false,
                            },
                        }
                    end
                    lspconfig[server_name].setup(opts)
                end,
            })

            -- Add diagnostics signs with prettier icons
            local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            -- Configure diagnostics display
            vim.diagnostic.config({
                virtual_text = {
                    prefix = "●", -- Could be '■', '▎', '●', etc
                    spacing = 4,
                },
                float = {
                    source = "always",
                    border = "rounded",
                },
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
            })
        end,
    },
}
