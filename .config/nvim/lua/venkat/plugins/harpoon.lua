return {
	"ThePrimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu) -- Toggle Harpoon menu
		vim.keymap.set("n", "<leader>a", mark.add_file) -- Add file to Harpoon

		vim.keymap.set("n", "<leader>1", function()
			ui.nav_file(1)
		end)
		vim.keymap.set("n", "<leader>2", function()
			ui.nav_file(2)
		end)

		vim.keymap.set("n", "<leader>3", function()
			ui.nav_file(3)
		end)
	end,
}