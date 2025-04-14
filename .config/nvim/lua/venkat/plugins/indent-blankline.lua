return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
        indent = {
            char = "┆",
            -- char = " ",
            highlight = "IblIndent",
        },
        scope = {
            enabled = false,
        },
    },
}
