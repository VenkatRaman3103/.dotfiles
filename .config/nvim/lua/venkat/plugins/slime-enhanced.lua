return {
    "VenkatRaman3103/slime-enhanced.nvim",
    dependencies = {
        "jpalardy/vim-slime",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("slime-enhanced").setup({
            target = "tmux",
            default_config = {
                socket_name = "default",
                target_pane = ":.1",
            },
            dont_ask_default = true,
            bracketed_paste = true,
            cell_delimiter = "# %%",
            keymaps = {
                send = "<leader>ss",
                send_cell_and_switch = "<leader>so",
                send_cell_no_switch = "<leader>sr",
                pick_target = "<leader>st",
            }
        })
    end,
}
