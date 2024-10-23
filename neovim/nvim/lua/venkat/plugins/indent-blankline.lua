return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	opts = {
		indent = { char = "│" },
		scope = {
			enabled = false, -- This disables the scope highlighting completely
			-- Or if you want to keep scope highlighting but remove underlining:
			-- show_start = false,
			-- show_end = false,
		},
	},
}
