return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>fm",
            function()
                require("conform").format({ timeout_ms = 10000, lsp_fallback = true })
            end,
            desc = "Format document",
        },
    },
    opts = {
        formatters_by_ft = {
            javascript = { { "prettier", "eslint_d" } },
            typescript = { { "prettier", "eslint_d" } },
            javascriptreact = { { "prettier", "eslint_d" } },
            typescriptreact = { { "prettier", "eslint_d" } },
            svelte = { { "prettier", "eslint_d" } },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },
            graphql = { "prettier" },
            lua = { "stylua" },
            python = { "black" },
        },
        format_on_save = {
            -- Customize format on save behavior
            timeout_ms = 10000,
            lsp_fallback = true,
        },
        formatters = {
            prettier = {
                -- Increase timeout for prettier
                options = {
                    timeout_ms = 10000,
                },
            },
            eslint_d = {
                -- Configure eslint_d to check for config files
                condition = function(ctx)
                    return vim.fs.find({
                        ".eslintrc.js",
                        ".eslintrc.cjs",
                        ".eslintrc.json",
                        ".eslintrc.yml",
                        ".eslintrc.yaml",
                    }, { path = ctx.filename, upward = true })[1]
                end,
                options = {
                    timeout_ms = 10000,
                },
            },
        },
    },
}
