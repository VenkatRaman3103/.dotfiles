return {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     priority = 1000,
    --     config = function()
    --         require("catppuccin").setup({
    --             flavour = "mocha", -- or "latte", "frappe", "macchiato"
    --         })
    --         vim.cmd("colorscheme catppuccin")
    --     end,
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
--     "rebelot/kanagawa.nvim",
--     name = "kanagawa",
--     priority = 1000,
--     config = function()
--         vim.cmd("colorscheme kanagawa-dragon")
--     end,
-- }

-- return {
-- "Mofiqul/vscode.nvim",
-- name = "vscode",
-- priority = 1000,
-- config = function()
--     -- require("nord").setup({
--     --     -- flavour = "mocha", -- or "latte", "frappe", "macchiato"
--     -- })
--     vim.cmd("colorscheme vscode")
-- end,
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

-- return {}
