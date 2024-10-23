return {
	-- -- "venkat/colorscheme", -- You can name this whatever you want
	-- name = "colorscheme",
	-- priority = 1000, -- High priority to load before other plugins
	-- config = function()
	-- 	local M = {}
	--
	-- 	-- Define colors
	-- 	local colors = {
	-- 		blue = "#3aa8e3",
	-- 		orange = "#fb8a20",
	-- 		green = "#70b276",
	-- 		purple = "#7b95ce",
	-- 		white = "#FFFFFF",
	-- 		gray = "#808080",
	-- 		yellow = "#e5c07b",
	-- 		red = "#e06c75",
	-- 		cyan = "#56b6c2",
	-- 		black = "#000000",
	-- 		dark_gray = "#3a3a3a",
	-- 		darker_gray = "#0e0e0e",
	-- 	}
	--
	-- 	function M.setup()
	-- 		-- Set a dark background
	-- 		vim.opt.background = "dark"
	--
	-- 		-- Define highlight groups that should have no background
	-- 		local hl_groups = {
	-- 			"Normal",
	-- 			"NormalFloat",
	-- 			"SignColumn",
	-- 			"StatusLine",
	-- 			"StatusLineNC",
	-- 			"LineNr",
	-- 			"FzfLuaNormal",
	-- 			"HarpoonNormal",
	-- 			"BufferLineFill",
	-- 			"BufferLineBackground",
	-- 			"BufferLineTab",
	-- 			"BufferLineTabSelected",
	-- 			"BufferLineTabClose",
	-- 			"TabLine",
	-- 			"TabLineFill",
	-- 			"TabLineSel",
	-- 			"Pmenu",
	-- 			"PmenuSbar",
	-- 			"PmenuThumb",
	-- 			"PmenuSel",
	-- 			"VertSplit",
	-- 			"VisualNOS",
	-- 			"DiffAdd",
	-- 			"DiffChange",
	-- 			"DiffDelete",
	-- 			"DiffText",
	-- 			"HarpoonWindow",
	-- 			"HarpoonWindowTitle",
	-- 			"HarpoonBorder",
	-- 		}
	--
	-- 		-- Apply no background to groups
	-- 		for _, group in ipairs(hl_groups) do
	-- 			vim.api.nvim_set_hl(0, group, { bg = "none" })
	-- 		end
	--
	-- 		-- Your existing highlight definitions
	-- 		local highlights = {
	-- 			-- Borders
	-- 			PmenuBorder = { fg = colors.white, bg = "none" },
	-- 			TelescopeBorder = { fg = colors.white, bg = "none" },
	-- 			HarpoonBorder = { fg = colors.white, bg = "none" },
	-- 			FloatBorder = { fg = colors.white, bg = "none" },
	--
	-- 			-- Cursor and selection
	-- 			Cursor = { fg = "#ffb86c", bg = colors.black },
	-- 			Visual = { bg = "#ffb86c", fg = colors.black },
	-- 			CursorLine = { bg = "", blend = 100 },
	-- 			CursorLineNr = { fg = colors.white, bg = "" },
	--
	-- 			-- Line numbers
	-- 			LineNr = { fg = colors.gray, bg = "none" },
	-- 			NormalNC = { bg = "none" },
	--
	-- 			-- Completion menu
	-- 			Pmenu = { bg = colors.darker_gray, fg = colors.white },
	-- 			PmenuSel = { bg = colors.dark_gray },
	-- 			PmenuSbar = { bg = "none" },
	-- 			PmenuThumb = { bg = "", fg = "none" },
	--
	-- 			-- Basic syntax
	-- 			["@variable"] = { fg = colors.white },
	-- 			["@variable.builtin"] = { fg = colors.purple },
	-- 			["@constant"] = { fg = colors.purple },
	-- 			["@constant.builtin"] = { fg = colors.purple },
	--
	-- 			-- Functions
	-- 			["@function"] = { fg = colors.orange },
	-- 			["@function.builtin"] = { fg = colors.orange },
	-- 			["@function.call"] = { fg = colors.orange },
	-- 			["@method"] = { fg = colors.orange },
	-- 			["@method.call"] = { fg = colors.orange },
	--
	-- 			-- Keywords and operators
	-- 			["@keyword"] = { fg = colors.blue },
	-- 			["@keyword.function"] = { fg = colors.blue },
	-- 			["@keyword.operator"] = { fg = colors.blue },
	-- 			["@keyword.return"] = { fg = colors.blue },
	-- 			["@conditional"] = { fg = colors.blue },
	-- 			["@repeat"] = { fg = colors.blue },
	-- 			["@operator"] = { fg = colors.blue },
	--
	-- 			-- Continue with all your other highlight groups...
	-- 			-- [Add all your other highlight groups here]
	-- 		}
	--
	-- 		-- Apply highlights
	-- 		for group, settings in pairs(highlights) do
	-- 			vim.api.nvim_set_hl(0, group, settings)
	-- 		end
	--
	-- 		-- Window separators
	-- 		vim.opt.fillchars = {
	-- 			horiz = "─",
	-- 			horizup = "┴",
	-- 			horizdown = "┬",
	-- 			vert = "│",
	-- 			vertleft = "┤",
	-- 			vertright = "├",
	-- 			verthoriz = "┼",
	-- 		}
	--
	-- 		-- Indentation settings
	-- 		local opt = vim.opt
	-- 		opt.tabstop = 4
	-- 		opt.shiftwidth = 4
	-- 		opt.softtabstop = 4
	-- 		opt.expandtab = false
	--
	-- 		-- File-specific indentation
	-- 		vim.api.nvim_create_autocmd({ "FileType" }, {
	-- 			pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	-- 			callback = function()
	-- 				vim.opt.tabstop = 4
	-- 				vim.opt.shiftwidth = 4
	-- 				vim.opt.softtabstop = 4
	-- 				vim.opt.expandtab = true
	-- 			end,
	-- 		})
	-- 	end
	--
	-- 	-- Call setup immediately
	-- 	M.setup()
	-- end,
}
