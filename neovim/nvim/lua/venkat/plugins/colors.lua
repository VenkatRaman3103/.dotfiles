-- lua/venkat/plugins/colors.lua
local M = {}

function M.setup(color)
	-- color = color or "catppuccin"
	-- vim.cmd.colorscheme(color)

	-- Set highlight groups to remove background color
	local highlights = {
		"Normal",
		"NormalNC",
		"NormalFloat",
		"SignColumn",
		"EndOfBuffer",
		"Pmenu", -- Popup menu
		"PmenuSel", -- Selected item in popup menu
		"StatusLine", -- Status line
		"StatusLineNC", -- Non-current status line
		"VertSplit", -- Vertical split line
	}

	for _, hl in ipairs(highlights) do
		vim.api.nvim_set_hl(0, hl, { bg = "none" }) -- Set background to none
	end
end

return {}
