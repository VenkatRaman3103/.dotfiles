-- return {
--     "diegoulloao/neofusion.nvim",
--     name = "neofusion",
--     priority = 1000,
--     config = function()
--         vim.cmd("colorscheme neofusion")
--     end,
-- }

-- return {
--     "kvrohit/substrata.nvim",
--     name = "substrata",
--     priority = 1000,
--     config = function()
--         -- require("substrata").setup({
--         --     flavour = "mocha", -- or "latte", "frappe", "macchiato"
--         -- })
--         vim.cmd("colorscheme substrata")
--     end,
-- }

return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha", -- or "latte", "frappe", "macchiato"
        })
        vim.cmd("colorscheme catppuccin")
    end,
}

-- return {
--     "shaunsingh/nord.nvim",
--     name = "nord",
--     priority = 1000,
--     config = function()
--         -- require("nord").setup({
--         --     -- flavour = "mocha", -- or "latte", "frappe", "macchiato"
--         -- })
--         vim.cmd("colorscheme nord")
--     end,
-- }

-- return {
--     "sainnhe/gruvbox-material",
--     name = "gruvbox",
--     priority = 1000,
--     config = function()
--         vim.cmd("colorscheme gruvbox-material")
--     end,
-- }
-- return {
--     "rebelot/kanagawa.nvim",
--     name = "kanagawa",
--     priority = 1000,
--     config = function()
--         vim.cmd("colorscheme kanagawa-wave")
--     end,
-- }

-- return {
--     "maxmx03/solarized.nvim",
--     lazy = false,
--     priority = 1000,
--     ---@type solarized.config
--     opts = {},
--     config = function(_, opts)
--         vim.o.termguicolors = true
--         vim.o.background = "dark"
--         require("solarized").setup(opts)
--         vim.cmd.colorscheme("solarized")
--     end,
-- }

-- return {
--     "Mofiqul/vscode.nvim",
--     name = "vscode",
--     priority = 1000,
--     config = function()
--         -- require("nord").setup({
--         --     -- flavour = "mocha", -- or "latte", "frappe", "macchiato"
--         -- })
--         vim.cmd("colorscheme vscode")
--     end,
-- }

-- return {
--     "projekt0n/github-nvim-theme",
--     name = "github-theme",
--     lazy = false, -- make sure we load this during startup if it is your main colorscheme
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--         require("github-theme").setup({
--             -- ...
--         })
--
--         vim.cmd("colorscheme github_dark_default")
--     end,
-- }

-- return {
--     "kdheepak/monochrome.nvim",
--     lazy = false, -- make sure we load this during startup if it is your main colorscheme
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--         vim.cmd("colorscheme monochrome")
--     end,
-- }

-- example lazy.nvim install setup
-- return {
--     "slugbyte/lackluster.nvim",
--     lazy = false,
--     priority = 1000,
--     init = function()
--         vim.cmd.colorscheme("lackluster")
--         -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
--         -- vim.cmd.colorscheme("lackluster-mint")
--     end,
-- }

-- return {
--     "aktersnurra/no-clown-fiesta.nvim",
--     lazy = false,
--     priority = 1000,
--     init = function()
--         vim.cmd.colorscheme("no-clown-fiesta")
--         -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
--         -- vim.cmd.colorscheme("lackluster-mint")
--     end,
-- }

-- return {
--     "AlexvZyl/nordic.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require("nordic").load()
--     end,
-- }

-- return {
--     "folke/tokyonight.nvim",
--     name = "tokyonight",
--     priority = 1000,
--     config = function()
--         require("tokyonight").setup({
--             -- flavour = "mocha", -- or "latte", "frappe", "macchiato"
--         })
--         vim.cmd("colorscheme tokyonight")
--     end,
-- }

-- return {}
