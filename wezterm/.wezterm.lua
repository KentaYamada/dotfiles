-- *******************************************************
--
-- wezterm configuration
-- see: https://wezfurlong.org/wezterm/config/files.html
--
-- *******************************************************

-- Pull in the wezterm API
local wezterm = require('wezterm')

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.color_scheme = 'nightfox'
config.window_background_opacity = 0.8

-- https://wezfurlong.org/wezterm/config/fonts.html#troubleshooting-fonts
-- see: wezterm ls-fonts --list-system
config.font = wezterm.font ('Hack Nerd Font')

config.use_ime = true

adjust_window_size_when_changing_font_size = false

-- and finally, return the configuration to wezterm
return config
