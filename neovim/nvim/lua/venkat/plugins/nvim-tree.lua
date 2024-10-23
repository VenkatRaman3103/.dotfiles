return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			local nvimtree = require("nvim-tree")
			-- recommended settings from nvim-tree documentation
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			nvimtree.setup({
				view = {
					width = 35,
					relativenumber = true,
				},
				renderer = {
					indent_markers = {
						enable = true,
					},
					icons = {
						glyphs = {},
					},
				},
				actions = {
					open_file = {
						window_picker = {
							enable = false,
						},
					},
				},
				filters = {
					custom = { ".DS_Store" },
				},
				git = {
					ignore = false,
				},
			})

			-- Set keymaps for nvim-tree
			local keymap = vim.keymap
			keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
			keymap.set(
				"n",
				"<leader>ef",
				"<cmd>NvimTreeFindFileToggle<CR>",
				{ desc = "Toggle file explorer on current file" }
			)
			keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
			keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

			-- Open nvim-tree when starting nvim
			vim.api.nvim_create_autocmd({ "VimEnter" }, {
				callback = function()
					-- Open nvim-tree only if there is no file or buffer open
					if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0) == "" then
						vim.cmd("NvimTreeOpen")
					end
				end,
			})
		end,
	},
}
