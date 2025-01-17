return {
    {
        "williamboman/mason.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("mason").setup({
                ui = {
                    check_outdated_packages_on_open = false,
                    border = "none",
                },
                max_concurrent_installers = 1,
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
                    "ts_ls",
                    "eslint",
                    "svelte",
                    "prismals",
                    "graphql",
                    "jsonls",
                    "cssmodules_ls",
                    "dockerls",
                    -- "webpack",

                    -- Systems Programming
                    "clangd", -- C/C++
                    "rust_analyzer", -- Rust
                    -- "cmake", -- CMake support

                    -- Python Development
                    "pyright", -- Static type checker
                    -- "ruff_lsp", -- Fast Python linter

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
                        -- Add some default capabilities
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
                    elseif server_name == "rust_analyzer" then
                        opts.settings = {
                            ["rust-analyzer"] = {
                                checkOnSave = {
                                    command = "clippy",
                                },
                            },
                        }
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
                            },
                        }
                    end

                    lspconfig[server_name].setup(opts)
                end,
            })
        end,
    },
}
