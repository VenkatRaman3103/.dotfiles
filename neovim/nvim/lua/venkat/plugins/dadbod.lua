return {
	"tpope/vim-dadbod",
	dependencies = {
		"kristijanhusak/vim-dadbod-ui",
	},
	config = function()
		vim.g.db_connection = {
			adapter = "pg",
			dbname = "fat", -- Your database name
			user = "postgres", -- Your database user
			password = "3103", -- Your password
			host = "localhost", -- Your host
			port = 5432, -- Your port
		}
	end,
}
