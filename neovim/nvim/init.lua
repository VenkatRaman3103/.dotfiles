-- Load core and lazy configuration
require("venkat.core")
require("venkat.lazy")

-- Function to apply custom color scheme and highlights
function ColorMyPencils()
	-- Set a dark background
	vim.opt.background = "dark"

	-- Set background to none for specific highlight groups
	local hl_groups = {
		"Normal",
		"NormalFloat",
		"SignColumn",
		"StatusLine",
		"StatusLineNC",
		"LineNr",
		"FzfLuaNormal",
		"HarpoonNormal",
		"BufferLineFill",
		"BufferLineBackground",
		"BufferLineTab",
		"BufferLineTabSelected",
		"BufferLineTabClose",
		"TabLine",
		"TabLineFill",
		"TabLineSel",
		"Pmenu",
		"PmenuSbar",
		"PmenuThumb",
		"PmenuSel",
		"VertSplit",
		"VisualNOS",
		"DiffAdd",
		"DiffChange",
		"DiffDelete",
		"DiffText",
		"HarpoonWindow",
		"HarpoonWindowTitle",
		"HarpoonBorder",
	}

	-- Set background to none for specific groups
	for _, group in ipairs(hl_groups) do
		vim.api.nvim_set_hl(0, group, { bg = "none" })
	end

	-- Borders and caret highlights
	vim.api.nvim_set_hl(0, "PmenuBorder", { fg = "#ffffff", bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#ffffff", bg = "none" })
	vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = "#ffffff", bg = "none" })
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff", bg = "none" })

	-- Custom caret (cursor) color
	vim.api.nvim_set_hl(0, "Cursor", { fg = "#ffb86c", bg = "#000000" })

	-- Visual selection highlight
	vim.api.nvim_set_hl(0, "Visual", { bg = "#ffb86c", fg = "#000000" })

	-- Highlight the current line and line number
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "", blend = 100 })
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bg = "" })

	-- Inactive lines with grayed-out numbers
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#808080", bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

	-- Custom settings for completion menu
	vim.api.nvim_set_hl(0, "Pmenu", { bg = "#0e0e0e", fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#3a3a3a" })
	vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "none" })
	vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "", fg = "none" })

	-- Disable underlines
	vim.api.nvim_set_hl(0, "Underlined", { underline = false })
	vim.api.nvim_set_hl(0, "SpellBad", { underline = false })
	vim.api.nvim_set_hl(0, "SpellCap", { underline = false })
	vim.api.nvim_set_hl(0, "SpellRare", { underline = false })
	vim.api.nvim_set_hl(0, "SpellLocal", { underline = false })

	-- Custom color scheme
	local blue = "#3aa8e3"
	local orange = "#fb8a20"
	local green = "#70b276"
	local purple = "#7b95ce"
	local white = "#FFFFFF"
	local gray = "#808080"
	local yellow = "#e5c07b"
	local red = "#e06c75"
	local cyan = "#56b6c2"

	-- Basic syntax
	vim.api.nvim_set_hl(0, "@variable", { fg = white })
	vim.api.nvim_set_hl(0, "@variable.builtin", { fg = purple }) -- self, this, etc
	vim.api.nvim_set_hl(0, "@constant", { fg = purple })
	vim.api.nvim_set_hl(0, "@constant.builtin", { fg = purple }) -- nil, true, false

	-- Functions
	vim.api.nvim_set_hl(0, "@function", { fg = orange })
	vim.api.nvim_set_hl(0, "@function.builtin", { fg = orange })
	vim.api.nvim_set_hl(0, "@function.call", { fg = orange })
	vim.api.nvim_set_hl(0, "@method", { fg = orange })
	vim.api.nvim_set_hl(0, "@method.call", { fg = orange })

	-- Keywords and operators
	vim.api.nvim_set_hl(0, "@keyword", { fg = blue })
	vim.api.nvim_set_hl(0, "@keyword.function", { fg = blue })
	vim.api.nvim_set_hl(0, "@keyword.operator", { fg = blue })
	vim.api.nvim_set_hl(0, "@keyword.return", { fg = blue })
	vim.api.nvim_set_hl(0, "@conditional", { fg = blue }) -- if, else, etc
	vim.api.nvim_set_hl(0, "@repeat", { fg = blue }) -- for, while, etc
	vim.api.nvim_set_hl(0, "@operator", { fg = blue }) -- =, +, -, etc

	-- Types
	vim.api.nvim_set_hl(0, "@type", { fg = yellow })
	vim.api.nvim_set_hl(0, "@type.builtin", { fg = yellow })
	vim.api.nvim_set_hl(0, "@type.qualifier", { fg = blue })
	vim.api.nvim_set_hl(0, "@type.definition", { fg = yellow })

	-- Strings and numbers
	vim.api.nvim_set_hl(0, "@string", { fg = green })
	vim.api.nvim_set_hl(0, "@string.escape", { fg = orange })
	vim.api.nvim_set_hl(0, "@number", { fg = orange })
	vim.api.nvim_set_hl(0, "@boolean", { fg = purple })

	-- Properties and parameters
	vim.api.nvim_set_hl(0, "@property", { fg = white })
	vim.api.nvim_set_hl(0, "@parameter", { fg = white })
	vim.api.nvim_set_hl(0, "@field", { fg = white })

	-- Comments
	vim.api.nvim_set_hl(0, "@comment", { fg = gray, italic = true })
	vim.api.nvim_set_hl(0, "@comment.documentation", { fg = gray, italic = true })

	-- Punctuation
	vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = white })
	vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = white })
	vim.api.nvim_set_hl(0, "@punctuation.special", { fg = blue })

	-- Tags (for JSX/HTML)
	vim.api.nvim_set_hl(0, "@tag", { fg = blue })
	vim.api.nvim_set_hl(0, "@tag.attribute", { fg = orange })
	vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = gray })

	-- CSS/SCSS specific
	vim.api.nvim_set_hl(0, "@property.css", { fg = blue })
	vim.api.nvim_set_hl(0, "@number.css", { fg = orange })
	vim.api.nvim_set_hl(0, "@string.css", { fg = green })

	-- JSON specific
	vim.api.nvim_set_hl(0, "@label.json", { fg = blue })
	vim.api.nvim_set_hl(0, "@string.json", { fg = green })

	-- LSP Semantic tokens
	vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = orange })
	vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = orange })
	vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = white })
	vim.api.nvim_set_hl(0, "@lsp.type.property", { fg = white })
	vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = white })
	vim.api.nvim_set_hl(0, "@lsp.typemod.function.defaultLibrary", { fg = orange })
	vim.api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary", { fg = purple })
	-- Custom colors for syntax highlighting
	vim.api.nvim_set_hl(0, "Keyword", { fg = blue, underline = false }) -- Blue
	vim.api.nvim_set_hl(0, "Function", { fg = orange, underline = false }) -- Orange
	vim.api.nvim_set_hl(0, "Class", { fg = "#FF4500", underline = false }) -- Reddish Orange
	vim.api.nvim_set_hl(0, "Tag", { fg = blue, underline = false }) -- Blue
	vim.api.nvim_set_hl(0, "TagName", { fg = blue, underline = false }) -- Blue

	-- Other colors
	vim.api.nvim_set_hl(0, "String", { fg = green }) -- Green
	vim.api.nvim_set_hl(0, "Number", { fg = orange }) -- Light Orange
	vim.api.nvim_set_hl(0, "Boolean", { fg = purple }) -- Purple
	vim.api.nvim_set_hl(0, "Null", { fg = purple }) -- Purple
	vim.api.nvim_set_hl(0, "None", { fg = purple }) -- Purple
	vim.api.nvim_set_hl(0, "Identifier", { fg = "#FFFFFF", underline = false })
	vim.api.nvim_set_hl(0, "Normal", { fg = "#FFFFFF", bg = "NONE" })
	vim.api.nvim_set_hl(0, "Variable", { fg = "#FFFFFF", bg = "NONE" }) -- Variable names

	-- Add these to your ColorMyPencils function
	vim.api.nvim_set_hl(0, "@function", { fg = orange, underline = false })
	vim.api.nvim_set_hl(0, "@function.call", { fg = orange, underline = false })
	vim.api.nvim_set_hl(0, "@method", { fg = orange, underline = false })
	vim.api.nvim_set_hl(0, "@method.call", { fg = orange, underline = false })

	-- Also ensure these are set (you already have some of these)
	vim.api.nvim_set_hl(0, "Function", { fg = orange, underline = false })
	vim.api.nvim_set_hl(0, "Identifier", { fg = "#FFFFFF", underline = false })

	-- Bracket color
	vim.api.nvim_set_hl(0, "Delimiter", { fg = "#FFFFFF" }) -- White for brackets

	-- Vertical separator bars for windows
	vim.opt.fillchars = {
		horiz = "─",
		horizup = "┴",
		horizdown = "┬",
		vert = "│",
		vertleft = "┤",
		vertright = "├",
		verthoriz = "┼",
	}

	vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#3a3a3a", bg = "none" })

	-- Adjust sign column and line number widths
	-- vim.opt.signcolumn = "auto"
	vim.opt.numberwidth = 5

	-- Telescope specific highlights
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#0e0e0e", fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#ff6a00", bold = true })

	-- Optional: set transparency and disable underlines globally
	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" }) -- Transparent background
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })

	-- Highlight the current line and line number
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "", blend = 100 }) -- No background for active line
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFFFFF", bg = "" }) -- White active line number

	-- Inactive lines with grayed-out numbers
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#808080", bg = "none" }) -- Gray for inactive line numbers

	-- Disable underlines globally
	vim.cmd([[ highlight clear Underlined ]])

	local opt = vim.opt

	-- Global indentation settings
	opt.tabstop = 4
	opt.shiftwidth = 4
	opt.softtabstop = 4
	opt.expandtab = false -- Use tabs instead of spaces

	-- Create an autocommand group to set file-specific indentation
	vim.api.nvim_create_autocmd({ "FileType" }, {
		pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		callback = function()
			vim.opt.tabstop = 4
			vim.opt.shiftwidth = 4
			vim.opt.softtabstop = 4
			vim.opt.expandtab = true -- Use spaces instead of tabs for these file types
		end,
	})
end

-- Apply the custom theme and highlights
ColorMyPencils()
