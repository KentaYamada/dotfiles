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

-- For example, changing the color scheme:
config.color_scheme = 'nightfox'
config.window_background_opacity = 0.8

-- and finally, return the configuration to wezterm
return config
