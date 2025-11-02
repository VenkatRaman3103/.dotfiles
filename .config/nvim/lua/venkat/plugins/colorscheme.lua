local grey = "#a7a7a7";
-- local grey = "#b0b0b0";
local lightGrey = "#666666";
local evenLightGrey = "#505050";
local white = "#ffffff";
local black = "#191919";
local oceanGray = "#70787f";
local silver = "#bec2cb";
local warnCoral = "#d2a374";  -- Warm coral for numbers
local mutedTeal = "#5f9ea0";  -- Muted teal for operators
local softSalmon = "#e67e7e"; -- Soft salmon for booleans
local sageGreen = "#7ca68c";  -- Muted sage green

-- return {
--     'kyza0d/xeno.nvim',
--     lazy = false,
--     priority = 1000, -- Load colorscheme early
--     config = function()
--         -- Create your custom theme here
--         require('xeno').new_theme('my-theme', {
--             base = '#1E1E1E',
--             accent = '#8CBE8C',
--         })
--         vim.cmd('colorscheme my-theme')
--     end,
-- }

return {
    "vague2k/vague.nvim",
    vague = "vague",
    config = function()
        require("vague").setup({
            transparent = true, -- set to true to remove background
            style = {
                -- Style settings unchanged
                boolean = "none",
                number = "none",
                float = "none",
                error = "none",
                comments = "italic",
                conditionals = "none",
                functions = "none",
                headings = "bold",
                operators = "none",
                strings = "italic",
                variables = "none",
                keywords = "none",
                keyword_return = "none",
                keywords_loop = "none",
                keywords_label = "none",
                keywords_exception = "none",
                builtin_constants = "none",
                builtin_functions = "none",
                builtin_types = "none",
                builtin_variables = "none",
                func = "none",
            },
            colors = {
                bg = "#18191a",
                fg = white,
                floatBorder = grey,
                border = grey,
                line = "#2C2C2D",
                comment = lightGrey,
                builtin = white,
                func = grey,
                string = white,
                -- string = "#7894ab",
                -- number = "#d2a374",
                -- number = grey,
                number = warnCoral,
                property = grey,
                constant = white,
                parameter = white,
                visual = "#2C2C2D",
                error = "#d2788c",
                -- error = grey,
                warning = "#e6be8c",
                hint = evenLightGrey,
                operator = grey,
                -- keyword = lightGrey,
                keyword = grey,
                type = grey,
                -- search = "#e6be8c",
                -- search = grey,
                search = "#2C2C2D",
                plus = "#8faf77",
                delta = "#e6be8c",
                punctuation = white,
            },

            -- Override colors
            -- colors = {
            --     bg = "#18191a",
            --     fg = "#cdcdcd",
            --     floatBorder = "#878787",
            --     line = "#282830",
            --     comment = "#646477",
            --     builtin = "#bad1ce",
            --     func = "#be8c8c",
            --     string = "#deb896",
            --     number = "#d2a374",
            --     property = "#c7c7d4",
            --     constant = "#b4b4ce",
            --     parameter = "#b9a3ba",
            --     visual = "#2C2C2D",
            --     error = "#d2788c",
            --     warning = "#e6be8c",
            --     hint = "#8ca0dc",
            --     operator = "#96a3b2",
            --     keyword = "#7894ab",
            --     type = "#a1b3b9",
            --     search = "#465362",
            --     plus = "#8faf77",
            --     delta = "#e6be8c",
            -- },
            -- You can also add specific border highlight groups if needed
            -- highlights = {
            --     -- Add specific border highlight groups
            --     NormalBorder = { fg = grey, bg = "NONE" },
            --     FloatBorder = { fg = grey, bg = "NONE" },
            --     VertSplit = { fg = grey, bg = "NONE" },
            --     StatusLineBorder = { fg = grey, bg = "NONE" },
            --     WinSeparator = { fg = grey, bg = "NONE" },
            -- }
        })
        -- vim.cmd("colorscheme vague")
    end,
}

-- return {
--     'olivercederborg/poimandres.nvim',
--     lazy = false,
--     priority = 1000,
--     config = function()
--         require('poimandres').setup {
--             -- leave this setup function empty for default config
--             -- or refer to the configuration section
--             -- for configuration options
--         }
--     end,
--
--     -- optionally set the colorscheme within lazy config
--     init = function()
--         vim.cmd("colorscheme poimandres")
--     end
-- }

-- return {
--     "EdenEast/nightfox.nvim",
--     name = "nightfox",
--     priority = 1000,
--     config = function()
--         require("nightfox").setup({
--             flavour = "nordfox",
--         })
--         vim.cmd("colorscheme terafox")
--     end,
-- }

-- return {
--     "aliqyan-21/darkvoid.nvim",
--     name = "darkvoid",
--     priority = 1000,
--     config = function()
--         require("darkvoid").setup({
--             -- flavour = "mocha", -- or "latte", "frappe", "macchiato"
--         })
--         vim.cmd("colorscheme darkvoid")
--     end,
-- }

-- return {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--         require("catppuccin").setup({
--             flavour = "mocha", -- or "latte", "frappe", "macchiato"
--         })
--         vim.cmd("colorscheme catppuccin")
--     end,
-- }

-- return {
--     "vinitkumar/oscura-vim",
--     lazy = false, -- Load during startup
--     name = "oscura",
--     priority = 1000,
--     config = function()
--         -- require("oscura").setup({
--         -- flavour = "mocha", -- or "latte", "frappe", "macchiato"
--         -- })
--         vim.cmd("colorscheme oscura")
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
--     "rjshkhr/shadow.nvim",
--     priority = 1000,
--     config = function()
--         vim.opt.termguicolors = true
--         vim.cmd.colorscheme("shadow")
--     end,
-- }

-- return {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     config = function()
--         vim.cmd("colorscheme rose-pine")
--     end,
-- }

-- return {
--     "datsfilipe/vesper.nvim",
--     name = "vesper",
--     priority = 1000,
--     config = function()
--         vim.cmd("colorscheme vesper")
--     end,
-- }

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
--         vim.opt.background = "dark"
--         vim.g.gruvbox_material_background = "hard"
--
--         -- Apply the colorscheme
--         vim.cmd("colorscheme gruvbox-material")
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

-- return {
--     "EdenEast/nightfox.nvim",
--     name = "nightfox",
--     priority = 1000,
--     config = function()
--         require("nightfox").setup({
--             -- flavour = "mocha", -- or "latte", "frappe", "macchiato"
--         })
--         vim.cmd("colorscheme terafox")
--     end,
-- }

-- return {
--     "webhooked/kanso.nvim",
--     name = "kanso",
--     priority = 1000,
--     config = function()
--         require('kanso').setup({
--             bold = true,      -- enable bold fonts
--             italics = true,   -- enable italics
--             compile = false,  -- enable compiling the colorscheme
--             undercurl = true, -- enable undercurls
--             commentStyle = { italic = true },
--             functionStyle = {},
--             keywordStyle = { italic = true },
--             statementStyle = {},
--             typeStyle = {},
--             transparent = false,   -- do not set background color
--             dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
--             terminalColors = true, -- define vim.g.terminal_color_{0,17}
--             colors = {             -- add/modify theme and palette colors
--                 palette = {},
--                 theme = { zen = {}, pearl = {}, ink = {}, all = {} },
--             },
--             overrides = function(colors) -- add/modify highlights
--                 return {}
--             end,
--             theme = "zen",      -- Load "zen" theme
--             background = {      -- map the value of 'background' option to a theme
--                 dark = "zen",   -- try "ink" !
--                 light = "pearl" -- try "mist" !
--             },
--         })
--
--         -- setup must be called before loading
--         -- vim.cmd("colorscheme kanso")
--     end,
-- }

-- return {}
