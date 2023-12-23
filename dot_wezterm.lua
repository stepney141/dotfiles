-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.color_scheme = 'PhD (base16)'

config.window_background_opacity = 0.8
config.text_background_opacity = 1.0

config.enable_tab_bar = false

config.font_size = 10.5
config.cell_width = 0.9
config.font = wezterm.font_with_fallback {
  'Noto Sans Mono', 'UDEV Gothic NF', 'Terminess Nerd Font Mono', 'MesloLGS NF', 'Noto Emoji', 'Symbola',
}


-- and finally, return the configuration to wezterm
return config

