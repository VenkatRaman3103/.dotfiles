return {
    "simrat39/rust-tools.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
    },
    config = function()
        local rt = require("rust-tools")
        rt.setup({
            server = {
                standalone = true,
                -- Your settings here
            },
            dap = {
                adapter = {
                    type = "executable",
                    command = "lldb-vscode",
                    name = "rt_lldb",
                },
            },
        })
    end,
}
