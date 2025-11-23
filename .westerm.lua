-- Pull wezterm API
local wezterm = require("wezterm")

-- Hold the configuration
local config = wezterm.config_builder()

-- Customization
config.font = wezterm.font("JetBrainsMono NFM")
-- config.font = wezterm.font("RobotoMono Nerd Font Mono")
config.font_size = 12
config.adjust_window_size_when_changing_font_size = false
config.line_height = 1.12
config.window_decorations = "RESIZE"
config.enable_tab_bar = false

-- Set background image
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/iefk8v9bwqhe1.png"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/marc.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/3440x1440 (1).jpeg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/eiznhxxoftde1.png"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/dt9xnkxbu5ge1.png"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/nature.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/codioful.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/mohammad.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/h1v5jfsfcike1.png"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/6ylu9zriqxie1.png"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/bgPic.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/bgPic1.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/bgPic2.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/bgPic3.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/bgPic01.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/bgPic0.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/galaxy1.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/abs1.jpg"

-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/cube_mono.jpeg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/red_distortion_1.jpeg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/mono_dark_distortion_2.jpeg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/mono_light_distortion_2.jpeg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/mono_dark_distortion_2.jpeg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/mono_light_distortion_21.jpeg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/mono_dark_distortion_1.jpeg"

-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/andrew-kliatskyi-7og8GybWcZw-unsplash.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/andrew-kliatskyi-mRY6jbGTjYg-unsplash.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/andrew-kliatskyi-XReNNdEiUy4-unsplash.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/andrew-kliatskyi-XReNNdEiUy4-unsplash-1.jpg"

-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/andrew-kliatskyi-XReNNdEiUy4-unsplash-1.jpg"

-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/kir-ufod2uFjkTI-unsplash.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/kir-ufod2uFjkTI-unsplash-1.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/noita-digital-zcx5ztIjQAM-unsplash.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/kir-38_gXU1KWv0-unsplash.jpg"

-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/Gs3LK9KXIAAvRM5.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/astronaut-mocha.png"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/astronaut.png"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/space-mocha.png"

-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/Gt64duhXMAABW90.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/1Gt64duhXMAABW90.jpg"
-- config.window_background_image = "C:/Users/Venkat Raman/Downloads/Gt64dxYWkAAHEYX.jpg"

-- Enable background image with improved opacity
config.window_background_image_hsb = {
    brightness = 0.005,
    -- brightness = 0.03,
    -- brightness = 0.02,
    hue = 1,
    saturation = 1,
}

-- Remove padding for a full-screen effect
config.window_padding = {
    left = 80,
    right = 80,
    -- left = 0,
    -- right = 0,
    top = 12,
    -- top = 5,
    bottom = 0,
}

-- config.keys = {
--     {
--         key = 'p',
--         mods = 'CTRL|SHIFT',
--         action = wezterm.action_callback(function(window, pane)
--             local overrides = window:get_config_overrides() or {}
--             local current_padding = overrides.window_padding or {
--                 left = 80,
--                 right = 80,
--                 top = 0,
--                 bottom = 0,
--             }
--
--             if current_padding.left == 80 then
--                 overrides.window_padding = {
--                     left = 10,
--                     right = 0,
--                     top = 12,
--                     bottom = 0,
--                 }
--             else
--                 overrides.window_padding = {
--                     left = 80,
--                     right = 80,
--                     top = 0,
--                     bottom = 0,
--                 }
--             end
--
--             window:set_config_overrides(overrides)
--         end),
--     },
-- }

local customTheme = {
    -- background = "#0e0e0e",
    -- background = ""#0e0e0e")#111111",
    -- background = "#000000",
    background = "#010101",
    -- background = "#020202",
    -- background = "#030303",
    -- background = "#000000",
    -- background = "#040404",
    -- background = "#060606",
    -- background = "#070707",
    -- background = "#090909",
    cursor_bg = "#ffffff", -- White cursor background

    -- -- Syntax Highlighting Colors
    -- onClick={()=>setActiveDecoration(}
    ansi = {
        "#a7a7a7", -- Black (dark)

        "#d2788c", -- Red (bright, visible)

        "#8faf77", -- Green (bright, visible)

        "#e6be8c", -- Yellow

        "#666666", -- Blue

        "#eeeeee", -- Magenta

        "#666666", -- Cyan

        "#eeeeee"  -- White

    },

    -- Bright colors for additional contrast

    brights = {

        "#666666", -- Bright Black

        "#d2788c", -- Bright Red

        "#8faf77", -- Bright Green

        "#e6be8c", -- Bright Yellow

        "#eeeeee", -- Bright Blue
        --
        "#666666", -- Bright Magenta

        "#a7a7a7", -- Bright Cyan

        "#eeeeee"  -- Bright White

    }
}

config.colors = customTheme

config.default_cursor_style = 'SteadyBlock'

-- Apply Catppuccin Mocha theme
-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = 'Mono Theme (terminal.sexy)'
-- config.color_scheme = 'Mono (terminal.sexy)'
config.color_scheme = "Tomorrow (dark) (terminal.sexy)"
-- config.color_scheme = 'Sequoia Monochrome'

-- Set default terminal to WSL with Ubuntu, and always navigate to the home directory (~)
config.default_prog = { "wsl.exe", "-d", "Ubuntu", "--cd", "~" }

-- Add PowerShell option to the launch menu
config.launch_menu = {
    {
        label = "PowerShell",
        args = { "powershell.exe" },
    },
}

-- Return the configuration to wezterm
return config
