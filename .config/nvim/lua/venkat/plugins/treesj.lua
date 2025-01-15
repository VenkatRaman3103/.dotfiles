return {
    "Wansmer/treesj",
    keys = { "<space>tj", "<space>bj", "<space>bs" },
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
    config = function()
        require("treesj").setup({--[[ your config ]]
        })
    end,
}
