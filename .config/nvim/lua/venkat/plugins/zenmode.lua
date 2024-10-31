return {
    "folke/zen-mode.nvim",
    opts = {
        window = {
            backdrop = 1,
            width = 80,
            height = 1,
            options = {
                relativenumber = true,
            },
            backdrop_hlgroup = "ZenBg",
        },
        plugins = {
            options = {
                enabled = true,
                ruler = false,
                showcmd = false,
                laststatus = 0,
            },
            twilight = { enabled = true },
            gitsigns = { enabled = false },
            tmux = { enabled = false },
            todo = { enabled = false },
            wezterm = { enabled = false },
        },
        on_open = function()
            vim.fn.system("tmux set status off") -- Hide tmux status bar
        end,
        on_close = function()
            vim.fn.system("tmux set status on") -- Restore tmux status bar
        end,
    },
    config = function(_, opts)
        require("zen-mode").setup(opts)
        -- Set the keybinding, here we're using <leader>z as an example
        vim.keymap.set("n", "<leader>zm", function()
            require("zen-mode").toggle()
        end, { desc = "Toggle Zen Mode" })

        -- Add an autocmd to restore tmux status bar when Neovim exits
        vim.api.nvim_create_autocmd("VimLeavePre", {
            callback = function()
                vim.fn.system("tmux set status on")
            end,
        })
    end,
}
