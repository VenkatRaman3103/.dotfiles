-- lspconfig.lua
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        -- We're NOT depending on mason-lspconfig.nvim here
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local keymap = vim.keymap

        -- Ensure mason is available
        local mason_ok, mason = pcall(require, "mason")
        if not mason_ok then
            vim.notify("Mason not installed - installing now", vim.log.levels.ERROR)
            vim.cmd([[Lazy install mason.nvim]])
            return
        end

        -- Get the Mason registry to manage packages directly
        local registry_ok, mr = pcall(require, "mason-registry")
        if not registry_ok then
            vim.notify("Mason registry not available", vim.log.levels.ERROR)
            return
        end

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
                keymap.set("n", "<leader>X", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts)

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

        -- Define servers to install manually without mason-lspconfig
        local servers = {
            "lua_ls",
            "ts_ls",
            "html",
            "cssls",
            "tailwindcss",
            "svelte",
            "graphql",
            "emmet_ls",
            "prismals",
            "pyright",
        }

        -- Create a mapping from server name to Mason package name
        local server_to_package = {
            ["lua_ls"] = "lua-language-server",
            ["ts_ls"] = "typescript-language-server",
            ["html"] = "html-lsp",
            ["cssls"] = "css-lsp",
            ["tailwindcss"] = "tailwindcss-language-server",
            ["svelte"] = "svelte-language-server",
            ["graphql"] = "graphql-language-service-cli",
            ["emmet_ls"] = "emmet-ls",
            ["prismals"] = "prisma-language-server",
            ["pyright"] = "pyright",
        }

        -- Manually install servers using Mason registry
        mr.refresh(function()
            for _, server_name in ipairs(servers) do
                local package_name = server_to_package[server_name]
                if package_name then
                    -- Only install if it's not already installed
                    local package = mr.get_package(package_name)
                    if not package:is_installed() then
                        vim.notify("Installing " .. package_name, vim.log.levels.INFO)
                        package:install()
                    end
                end
            end

            -- Now set up the servers
            -- Default setup for most servers
            for _, server_name in ipairs(servers) do
                if server_name ~= "lua_ls" and
                    server_name ~= "ts_ls" and
                    server_name ~= "cssls" and
                    server_name ~= "graphql" and
                    server_name ~= "emmet_ls" then
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end
            end

            -- Server-specific configurations
            lspconfig["cssls"].setup({
                capabilities = capabilities,
                settings = {
                    css = { validate = true },
                    scss = { validate = true },
                    less = { validate = true },
                },
            })

            lspconfig["graphql"].setup({
                capabilities = capabilities,
                filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
            })

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

            lspconfig["lua_ls"].setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        completion = { callSnippet = "Replace" },
                    },
                },
            })

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
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = false,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = false,
                    },
                },
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "none",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = false,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = false,
                        },
                    },
                    javascript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "none",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = false,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = false,
                        },
                    },
                },
            })
        end)

        -- Configure file type associations explicitly
        vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
            pattern = "*.tsx",
            callback = function()
                vim.bo.filetype = "typescriptreact"
            end,
        })
    end,
}
