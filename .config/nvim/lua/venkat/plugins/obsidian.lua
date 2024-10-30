-- ~/.config/nvim/lua/venkat/plugins/obsidian.lua
return {
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = true,
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            workspaces = {
                {
                    name = "vault",
                    path = "/mnt/c/Users/Venkat Raman/Notes",
                },
            },
            ui = {
                enable = true,
            },
        },
    },
}
