-- Pull wezterm API
local wezterm = require("wezterm")
-- Hold the configuration
local config = wezterm.config_builder()

-- Customization
config.font = wezterm.font("JetBrainsMono NFM")
-- config.font = wezterm.font("RobotoMono Nerd Font Mono")
config.font_size = 13
config.adjust_window_size_when_changing_font_size = false
config.line_height = 1
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
-- config.ligature = false

-- Set background image
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/3440x1440 (1).jpeg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/Group 1.jpg"

-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/179428810-69b440d1-7107-49f2-ab2b-aaab1c449cce.jpeg"

-- Enable background image with improved opacity
config.window_background_image_hsb = {
    brightness = 0.03, -- Dimmer background image for better contrast
    hue = 1,
    saturation = 1,
}

-- Add a background color overlay to improve text contrast
config.text_background_opacity = 1 -- Keep text background fully opaque for readability

-- Remove padding for a full-screen effect
config.window_padding = {
    left = 0,
    right = 0,
    top = 9, -- Reduced top padding for a cleaner look
    bottom = 0,
}

-- Define custom colors
local neofusion_theme = {
    background = "#0e0e0e",
    foreground = "#ffffff", -- Set the text color to white
    cursor_bg = "#ffffff", -- Cursor background (caret) color
    selection_bg = "#ffb86c", -- Selection background
    selection_fg = "#000000", -- Selection foreground
    cursor_border = "#ffffff",
    ansi = {
        "#ffffff", -- Black (Host)
        "#ffffff", -- Red (Syntax string)
        "#3fb649", -- Magenta (Syntax var)
        "#5db2f8", -- Yellow (Command second)
        "#979797", -- Blue (Path)
        "#3fb649", -- Magenta (Syntax var)
        "#86dbf5", -- Cyan (Prompt)
        "#ffffff", -- White
    },
    brights = {
        "#979797", -- Bright Black
        "#C95B20", -- Bright Red (Command error)
        "#3fb649", -- Bright Blue (Folder)
        "#86dbf5", -- Bright Yellow
        "#5db2f8", -- Bright Blue (Folder)
        "#3fb649", -- Bright Magenta
        "#5db2f8", -- Bright Cyan
        "#ffffff", -- Bright White
    },
}
config.colors = neofusion_theme

-- Set default terminal to WSL with Ubuntu, and always navigate to the home directory (~)
config.default_prog = { "wsl.exe", "-d", "Ubuntu", "--cd", "~" }

-- Add PowerShell option to the launch menu
config.launch_menu = {
    {
        label = "PowerShell",
        args = { "powershell.exe" },
    },
}

-- Fine-tuning opacity and visual settings for comfort
config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.3, -- Dims inactive panes for better focus
}

-- Return the configuration to wezterm
return config
