return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        -- Import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")

        -- Configure treesitter
        treesitter.setup({
            -- Enable syntax highlighting
            highlight = {
                enable = true,
            },
            -- Enable indentation
            indent = { enable = true },
            -- Ensure these language parsers are installed
            ensure_installed = {
                "json",
                "javascript",
                -- "jsx",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "prisma",
                "markdown",
                "markdown_inline",
                "svelte",
                "graphql",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "query",
                "vimdoc",
                "c",
                "cpp",
            },
            -- Additional required fields
            modules = {},
            sync_install = false,
            ignore_install = {},
            auto_install = true,
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })

        -- Configure nvim-ts-autotag
        require("nvim-ts-autotag").setup()
    end,
}
