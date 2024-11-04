-- *******************************************************
--
-- wezterm configuration
-- see: https://wezfurlong.org/wezterm/config/files.html
--
-- *******************************************************
local wezterm = require('wezterm')

-- This will hold the configuration.
local config = wezterm.config_builder()

config.automatically_reload_config = true

-- This is where you actually apply your config choices

-- see: https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = 'nightfox'
config.window_background_opacity = 0.8
config.macos_window_background_blur = 20

-- see: https://wezfurlong.org/wezterm/config/fonts.html#troubleshooting-fonts
-- see: wezterm ls-fonts --list-system
config.font = wezterm.font ('Hack Nerd Font')
config.font_size = 12.0

config.use_ime = true

config.adjust_window_size_when_changing_font_size = false

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}

config.window_background_gradient = {
   colors = { "#000000" },
}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
   local background = "#5c6d74"
   local foreground = "#FFFFFF"

   if tab.is_active then
     background = "#ae8b2d"
     foreground = "#FFFFFF"
   end

   local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

   return {
     { Background = { Color = background } },
     { Foreground = { Color = foreground } },
     { Text = title },
   }
 end)

return config
