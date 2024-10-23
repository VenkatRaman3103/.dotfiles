return {
	"folke/zen-mode.nvim",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		relativenumber = true,
		-- Center the working area
		center = true, -- Assuming you want a property to center content
	},
	window = {
		width = 0.40,
		-- Optionally, you can set height and position to ensure centering
		height = 0.90, -- Adjust height as necessary
		-- Add any other window options if required
	},
	plugins = {
		wezterm = {
			enabled = false, -- Disabled to remove tmux line
		},
	},
}
