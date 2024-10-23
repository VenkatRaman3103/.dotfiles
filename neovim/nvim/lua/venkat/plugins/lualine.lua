return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = {
					normal = {
						a = { fg = "#ffffff", bg = "#c95b20" }, -- Active section
						b = { fg = "#ffffff", bg = "#0f0f0f" }, -- Inactive section (lighter shade)
						c = { fg = "#ffffff", bg = "NONE" }, -- Current section (lighter shade)
					},
					insert = { a = { fg = "#ffffff", bg = "#1a1a1a" } }, -- Insert mode
					visual = { a = { fg = "#ffffff", bg = "#38b3ff" } }, -- Visual mode
					replace = { a = { fg = "#ffffff", bg = "#1a1a1a" } }, -- Replace mode
					command = { a = { fg = "#ffffff", bg = "#3fb649" } }, -- Command mode
				},
				component_separators = { left = "│", right = "│" }, -- Component separators
				section_separators = { left = "", right = "" }, -- Section separators
				global_status = true, -- If you want a global status line (optional)
			},
			sections = {
				lualine_a = { "mode" }, -- Modes (leftmost)
				lualine_b = { "filename" }, -- Branch section
				lualine_c = { "diagnostics" }, -- Filename section
				lualine_x = { "filetype" }, -- Encoding, file format, file type
				lualine_y = { "diff" }, -- Progress section
				lualine_z = { "branch" }, -- Location section
			},
			extensions = {}, -- Extensions if you have any
		})

		-- Set branch section color
		vim.cmd([[highlight LualineBranch guifg=#000000]]) -- Set branch name to black

		vim.g.catppuccin_flavour = "mocha"
	end,
}
