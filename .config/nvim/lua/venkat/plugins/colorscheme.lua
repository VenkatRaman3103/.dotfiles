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
--     "aditya-azad/candle-grey",
--     priority = 1000,
--     config = function()
--         vim.cmd([[colorscheme candle-grey]])
--     end,
-- }

-- return {
--     "kvrohit/rasmus.nvim",
--     priority = 1000,
--     config = function()
--         vim.cmd([[colorscheme rasmus]])
--     end,
-- }

-- return {
--     "zenbones-theme/zenbones.nvim",
--     -- Optionally install Lush. Allows for more configuration or extending the colorscheme
--     -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
--     -- In Vim, compat mode is turned on as Lush only works in Neovim.
--     dependencies = "rktjmp/lush.nvim",
--     lazy = false,
--     priority = 1000,
--     -- you can set set configuration options here
--     config = function()
--         vim.g.zenbones_darken_comments = 45
--         vim.cmd.colorscheme("zenbones")
--     end,
-- }

-- return {
--     {
--         "rktjmp/lush.nvim", -- Add this to install the missing dependency
--         lazy = true,
--     },
--     {
--         "briones-gabriel/darcula-solid.nvim",
--         priority = 1000,
--         dependencies = { "rktjmp/lush.nvim" }, -- Ensure it loads first
--         config = function()
--             vim.cmd("colorscheme darcula-solid")
--         end,
--     },
-- }

-- return {
--     "vague2k/vague.nvim",
--     vague = "vague",
--     config = function()
--         require("vague").setup({
--             transparent = false, -- don't set background
--             style = {
--                 -- "none" is the same thing as default. But "italic" and "bold" are also valid options
--                 boolean = "none",
--                 number = "none",
--                 float = "none",
--                 error = "none",
--                 comments = "italic",
--                 conditionals = "none",
--                 functions = "none",
--                 headings = "bold",
--                 operators = "none",
--                 strings = "italic",
--                 variables = "none",
--
--                 -- keywords
--                 keywords = "none",
--                 keyword_return = "none",
--                 keywords_loop = "none",
--                 keywords_label = "none",
--                 keywords_exception = "none",
--
--                 -- builtin
--                 builtin_constants = "none",
--                 builtin_functions = "none",
--                 builtin_types = "none",
--                 builtin_variables = "none",
--             },
--             -- Override colors
--             colors = {
--                 bg = "#18191a",
--                 fg = "#cdcdcd",
--                 floatBorder = "#878787",
--                 line = "#282830",
--                 comment = "#646477",
--                 builtin = "#bad1ce",
--                 func = "#be8c8c",
--                 string = "#deb896",
--                 number = "#d2a374",
--                 property = "#c7c7d4",
--                 constant = "#b4b4ce",
--                 parameter = "#b9a3ba",
--                 visual = "#363738",
--                 error = "#d2788c",
--                 warning = "#e6be8c",
--                 hint = "#8ca0dc",
--                 operator = "#96a3b2",
--                 keyword = "#7894ab",
--                 type = "#a1b3b9",
--                 search = "#465362",
--                 plus = "#8faf77",
--                 delta = "#e6be8c",
--             },
--         })
--         vim.cmd("colorscheme vague")
--     end,
-- }
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
