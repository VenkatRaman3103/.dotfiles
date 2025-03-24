return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "saadparwaiz1/cmp_luasnip" },
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
        config = function()
            local cmp_ok, cmp = pcall(require, "cmp")
            if not cmp_ok then
                return
            end
            local luasnip_ok, luasnip = pcall(require, "luasnip")
            if not luasnip_ok then
                return
            end

            vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#555555", bg = "" })

            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                completion = {
                    completeopt = "menu,menuone,preview,noselect",
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "cmdline" },
                }),
                window = {
                    completion = {
                        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                        winhighlight = "Normal:Normal,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
                    },
                    documentation = {
                        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                        winhighlight = "Normal:Normal,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
                    },
                },
            })

            cmp.setup.cmdline("/", {
                mapping = {
                    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
                    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
                    ["<C-e>"] = cmp.mapping.abort(), -- Close the completion menu
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm the selected item
                },
                sources = {
                    { name = "buffer" },
                },
            })

            cmp.setup.cmdline("/", {
                mapping = {
                    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
                    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
                    ["<C-e>"] = cmp.mapping.abort(), -- Close the completion menu
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm the selected item
                },
                sources = {
                    { name = "buffer" },
                },
            })

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.pyright.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({ capabilities = capabilities })
            -- lspconfig.rust_analyzer.setup({ capabilities = capabilities })
            lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.sqls.setup({ capabilities = capabilities })
            lspconfig.cssls.setup({ capabilities = capabilities })
            lspconfig.html.setup({ capabilities = capabilities })
        end,
    },
}
