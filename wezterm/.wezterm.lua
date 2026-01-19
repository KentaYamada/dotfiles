-- *******************************************************
--
-- wezterm configuration
-- see: https://wezfurlong.org/wezterm/config/files.html
--
-- *******************************************************
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.automatically_reload_config = true

-- This is where you actually apply your config choices

-- see: https://wezfurlong.org/wezterm/colorschemes/index.html
-- config.color_scheme = "nightfox"
config.color_scheme = "Kanagawa (Gogh)"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 15

-- see: https://wezfurlong.org/wezterm/config/fonts.html#troubleshooting-fonts
-- see: wezterm ls-fonts --list-system
-- config.font = wezterm.font ('Hack Nerd Font')
config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font", weight = "Regular" },
	"Source Han Sans JP", -- 日本語
	"Noto Color Emoji", -- Linux
	"Apple Color Emoji", -- macOS
})
config.font_size = 12.0

config.use_ime = true

config.adjust_window_size_when_changing_font_size = false

config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = true

config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

config.window_background_gradient = {
	colors = { "#000000" },
}

-- for linux
config.front_end = "OpenGL"
config.enable_wayland = false

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

wezterm.on("update-right-status", function(window, pane)
	local date = wezterm.strftime("%Y-%m-%d %H:%M:%S")

	-- Make it italic and underlined
	window:set_right_status(wezterm.format({
		{ Attribute = { Underline = "Single" } },
		{ Attribute = { Italic = true } },
		{ Text = date },
	}))
end)

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	-- 起動時に最大サイズで表示
	local _tab, _pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return config
