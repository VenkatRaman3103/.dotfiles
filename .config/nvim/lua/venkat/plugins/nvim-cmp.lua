-- ~/.config/nvim/lua/venkat/plugins/nvim-cmp.lua
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
            local bg = "#0e0e0e"
            local cmp_ok, cmp = pcall(require, "cmp")
            if not cmp_ok then
                return
            end
            local luasnip_ok, luasnip = pcall(require, "luasnip")
            if not luasnip_ok then
                return
            end
            require("luasnip.loaders.from_vscode").lazy_load()

            -- Setup completion highlights
            vim.api.nvim_set_hl(0, "CmpNormal", { bg = bg })
            vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = bg })

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
                    { name = "vim-dadbod-completion" }, -- For SQL completion
                }),
                window = {
                    completion = {
                        winhighlight = "Normal:CmpNormal,CursorLine:PmenuSel,Search:None",
                    },
                    documentation = {
                        winhighlight = "Normal:CmpDocNormal,CursorLine:PmenuSel,Search:None",
                    },
                },
            })

            -- Special filetypes configuration

            -- SQL files
            cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
                sources = cmp.config.sources({
                    { name = "vim-dadbod-completion" },
                    { name = "buffer" },
                    { name = "nvim_lsp" },
                })
            })

            local types = require("cmp.types")

            cmp.setup.filetype({ "css", "scss", "sass", "less" }, {
                sources = cmp.config.sources({
                    {
                        name = "nvim_lsp",
                        priority = 1000,
                        entry_filter = function(entry, ctx)
                            -- Skip snippet completion items only
                            if entry:get_kind() == types.lsp.CompletionItemKind.Snippet then
                                return false
                            end
                            return true
                        end,
                    },
                    { name = "buffer", priority = 500 },
                    { name = "path",   priority = 250 },
                })
            })

            -- Command-line completion configuration
            cmp.setup.cmdline("/", {
                mapping = {
                    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
                    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                },
                sources = {
                    { name = "buffer" },
                },
            })

            -- Command and search completion
            cmp.setup.cmdline(":", {
                mapping = {
                    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
                    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                },
                sources = cmp.config.sources({
                    { name = "path" },
                    { name = "cmdline" },
                }),
            })
        end,
    },
}
