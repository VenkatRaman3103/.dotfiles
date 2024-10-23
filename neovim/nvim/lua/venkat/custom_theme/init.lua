local M = {}

-- Define your color palette
local colors = {
	bg = "#0e0e0e",
	fg = "#ffffff",
	red = "#ff0000",
	green = "#5cb163",
	blue = "#38b3ff",
	yellow = "#ffff00",
	purple = "#800080",
	cyan = "#00ffff",
	orange = "#ff7d0b",
	gray = "#808080",
	redishOrange = "#e25303",
	white = "#ffffff",
	lightPurple = "#7b95ce",
	black = "#000000",
}

-- Setup function to apply the custom theme
function M.setup()
	-- Clear existing highlights
	vim.cmd("highlight clear")
	-- Set the background
	vim.o.background = "dark"
	-- Set colorscheme name
	vim.g.colors_name = "custom-theme"

	-- Define highlight groups
	local highlights = {
		-- Basic colors for common elements
		Normal = { fg = colors.fg, bg = colors.bg },
		LineNr = { fg = colors.gray },
		CursorLine = { bg = colors.bg },
		CursorLineNr = { fg = colors.white },
		StatusLine = { fg = colors.fg, bg = colors.gray },
		-- Divider highlights
		VertSplit = { fg = colors.black },
		WinSeparator = { fg = colors.black },
		WinSeparatorBottom = { fg = colors.black },
		-- General syntax elements
		Comment = { fg = colors.gray, italic = true },
		Constant = { fg = colors.lightPurple },
		String = { fg = colors.green },
		-- Identifier = { fg = colors.white },
		-- Function = { fg = colors.blue },
		-- Statement = { fg = colors.blue },
		PreProc = { fg = colors.cyan },
		Type = { fg = colors.blue },
		Special = { fg = colors.white },
		-- Additional syntax groups
		-- Keyword = { fg = colors.blue },
		Operator = { fg = colors.white },
		Number = { fg = colors.lightPurple },
		Boolean = { fg = colors.lightPurple },
		FunctionBuiltin = { fg = colors.blue },
		VariableBuiltin = { fg = colors.blue },
		Conditional = { fg = colors.redishOrange },
		Repeat = { fg = colors.redishOrange },
		Exception = { fg = colors.redishOrange },
		Include = { fg = colors.redishOrange },
		Define = { fg = colors.redishOrange },
		Macro = { fg = colors.blue },
		-- HTML tags in blue
		htmlTag = { fg = colors.blue },
		htmlEndTag = { fg = colors.blue },
		htmlTagName = { fg = colors.blue },
		-- UI elements
		Title = { fg = colors.green },
		Visual = { bg = colors.gray },
		Search = { bg = colors.orange, fg = colors.bg },
		Pmenu = { bg = colors.gray, fg = colors.white },
		PmenuSel = { bg = colors.blue, fg = colors.white },
		TabLine = { fg = colors.gray, bg = colors.bg },
		TabLineSel = { fg = colors.fg, bg = colors.gray },
		-- Diagnostic highlighting
		DiagnosticError = { fg = colors.red },
		DiagnosticWarn = { fg = colors.yellow },
		DiagnosticInfo = { fg = colors.blue },
		DiagnosticHint = { fg = colors.green },
		-- Git highlighting
		DiffAdd = { fg = colors.green, bg = colors.bg },
		DiffChange = { fg = colors.yellow, bg = colors.bg },
		DiffDelete = { fg = colors.red, bg = colors.bg },
		DiffText = { fg = colors.blue, bg = colors.bg },
		-- More specific syntax elements
		Error = { fg = colors.red, bold = true, underline = true },
		Todo = { fg = colors.yellow, bold = true, bg = colors.bg },
		-- Additional syntax groups
		TSMethod = { fg = colors.blue },
		TSField = { fg = colors.blue },
		-- Highlighting for the length property
		TSProperty = { fg = colors.blue },

		-- Updated and new highlight groups
		Function = { fg = colors.orange }, -- Function name in orange
		Keyword = { fg = colors.redishOrange }, -- Function keyword and others in redishOrange
		Identifier = { fg = colors.white }, -- Variable names in white
		Statement = { fg = colors.blue }, -- Variable declaration keywords in blue

		-- More specific syntax elements for JavaScript/TypeScript
		javaScriptFunction = { fg = colors.redishOrange }, -- 'function' keyword
		typescriptFuncKeyword = { fg = colors.redishOrange }, -- 'function' keyword in TypeScript
		jsxComponentName = { fg = colors.orange }, -- Component names in JSX

		-- Updated highlight groups for JavaScript/TypeScript keywords
		typescriptVariable = { fg = colors.blue },
		javaScriptIdentifier = { fg = colors.blue },
		typescriptStorageClass = { fg = colors.blue }, -- Catches 'let', 'const', sometimes 'var'
		javaScriptStorageClass = { fg = colors.blue }, -- Catches 'let', 'const', sometimes 'var'
	}

	-- Apply highlight groups
	for group, settings in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, settings)
	end

	-- Filetype-specific highlights for tsx, jsx, js, and ts
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		callback = function()
			-- Existing highlights...
			vim.api.nvim_set_hl(0, "TSKeyword", { fg = colors.redishOrange })
			vim.api.nvim_set_hl(0, "TSFunction", { fg = colors.orange })
			vim.api.nvim_set_hl(0, "TSVariable", { fg = colors.white })

			-- Updated highlight groups for 'let', 'const', 'var'
			vim.api.nvim_set_hl(0, "TSKeywordFunction", { fg = colors.redishOrange })
			vim.api.nvim_set_hl(0, "TSStorageClass", { fg = colors.blue }) -- This should catch 'let', 'const', 'var'
			vim.api.nvim_set_hl(0, "TSVariableBuiltin", { fg = colors.blue })

			-- Additional highlight groups to ensure coverage
			vim.api.nvim_set_hl(0, "@keyword.storage", { fg = colors.blue })
			vim.api.nvim_set_hl(0, "@storageclass", { fg = colors.blue })
		end,
	})

	vim.cmd([[
        augroup JavaScriptHighlights
        autocmd!
        autocmd FileType javascript,typescript,javascriptreact,typescriptreact syntax match JsKeyword "\<\(let\|const\|var\)\>"
        autocmd FileType javascript,typescript,javascriptreact,typescriptreact highlight JsKeyword guifg=#38b3ff
        augroup END
]])
end

-- Export the modul
return M
