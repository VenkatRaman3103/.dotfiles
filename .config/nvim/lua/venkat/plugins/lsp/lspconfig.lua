return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local keymap = vim.keymap
        local on_attach = require("venkat.plugins.lsp.lspconfig").on_attach
        local util = require("lspconfig/util")

        -- Create a single LspAttach autocmd for inlay hints
        -- vim.api.nvim_create_autocmd("LspAttach", {
        --     callback = function(args)
        --         local client = vim.lsp.get_client_by_id(args.data.client_id)
        --         local bufnr = args.buf
        --
        --         -- Check for inlay hint capability and apply to all file types including TSX
        --         if client and client.server_capabilities.inlayHintProvider then
        --             -- Get buffer file type
        --             local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
        --
        --             -- Enable inlay hints for this buffer
        --             pcall(function()
        --                 vim.lsp.inlay_hint.enable(true, bufnr)
        --             end)
        --
        --             -- Add a keymap to toggle inlay hints
        --             local opts = { buffer = bufnr, silent = true, desc = "Toggle inlay hints" }
        --             vim.keymap.set("n", "<leader>ih", function()
        --                 local current_buffer = vim.api.nvim_get_current_buf()
        --                 pcall(function()
        --                     local enabled = vim.lsp.inlay_hint.is_enabled(current_buffer)
        --                     vim.lsp.inlay_hint.enable(not enabled, current_buffer)
        --                 end)
        --             end, opts)
        --
        --             -- Log that inlay hints were enabled for this buffer/filetype
        --             -- print("Inlay hints enabled for " .. filetype .. " in buffer " .. bufnr)
        --         end
        --     end,
        -- })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }
                opts.desc = "Show LSP references"

                local telescope_builtin = require("telescope.builtin")

                -- keymap.set("n", "gr", function()
                --     telescope_builtin.lsp_references({
                --         show_line = false,
                --     })
                -- end, { desc = "Show LSP references", silent = true })
                --
                -- keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

                -- opts.desc = "Go to declaration"
                -- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

                -- opts.desc = "Show LSP definitions"
                -- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

                -- opts.desc = "Show LSP implementations"
                -- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

                -- opts.desc = "Show LSP type definitions"
                -- keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

                -- opts.desc = "Go to previous diagnostic"
                -- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
                --
                -- opts.desc = "Go to next diagnostic"
                -- keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
            end,
        })

        local capabilities = cmp_nvim_lsp.default_capabilities()

        local signs = { Error = "", Warn = "", Hint = "", Info = "" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

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
                -- "typescript-language-server", -- Use the full name here
                -- "tsserver", -- Use the full name here
                "ts_ls", -- Use the full name here
                "rust_analyzer",
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
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ["cssls"] = function()
                lspconfig["cssls"].setup({
                    capabilities = capabilities,
                    settings = {
                        css = { validate = true },
                        scss = { validate = true },
                        less = { validate = true },
                    },
                    on_attach = function(_, bufnr)
                        -- Disable formatting for CSS/SCSS if you use an external formatter
                        vim.api.nvim_buf_set_option(bufnr, "formatexpr", "")
                    end,
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
                            diagnostics = {
                                globals = { "vim" },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                })
            end,
            ["rust_analyzer"] = function()
                lspconfig["rust_analyzer"].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    filetypes = { "rust" },
                    root_dir = util.root_pattern("Cargo.toml"),
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                allFeatures = true,
                            },
                            -- checkOnSave = {
                            --     command = "clippy",
                            -- },
                        },
                    },
                })
            end,
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
                            -- Use more concise parameter hints
                            includeInlayParameterNameHints = "none", -- Change from "all" to "none"
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = false, -- Disable verbose parameter type hints
                            includeInlayVariableTypeHints = false, -- Turn this off
                            includeInlayPropertyDeclarationTypeHints = false, -- Turn this off
                            includeInlayFunctionLikeReturnTypeHints = true, -- Keep return type hints as they're useful
                            includeInlayEnumMemberValueHints = false, -- Turn this off
                        },
                    },
                    settings = {
                        typescript = {
                            inlayHints = {
                                includeInlayParameterNameHints = "none", -- Change from "all" to "none"
                                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                includeInlayFunctionParameterTypeHints = false, -- Disable verbose parameter type hints
                                includeInlayVariableTypeHints = false, -- Turn this off
                                includeInlayPropertyDeclarationTypeHints = false, -- Turn this off
                                includeInlayFunctionLikeReturnTypeHints = true, -- Keep return type hints as they're useful
                                includeInlayEnumMemberValueHints = false, -- Turn this off
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
                        typescriptreact = {
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
                        javascriptreact = {
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
                    -- on_attach = function(client, bufnr)
                    --     if client.server_capabilities.inlayHintProvider then
                    --         vim.lsp.inlay_hint.enable(true, bufnr)
                    --     end
                    -- end,
                })
            end,
        })
    end,
}
