return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp", -- Ensure this is included
        "saadparwaiz1/cmp_luasnip", -- Ensure snippet support
        "L3MON4D3/LuaSnip", -- LuaSnip for snippets
        "rafamadriz/friendly-snippets", -- Optional: For predefined snippets
        "onsails/lspkind-nvim", -- Add lspkind for LSP item icons
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect", -- Adjust options if needed
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body) -- Expand snippets
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- LSP source
                { name = "luasnip" }, -- Snippet source
                { name = "buffer" }, -- Buffer source
                { name = "path" }, -- Path source
            }),
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
            window = {
                completion = {
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                },
                documentation = {
                    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                },
            },
        })
    end,
}
