return {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*",
    config = function()
        require("nvim-surround").setup({
            keymaps = {
                visual = "s", -- Change from "S" to "s" for visual mode
            }
        })
    end,
}
