local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local act = wezterm.action

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():toggle_fullscreen()
end)

-- Terminal
config.initial_cols = 120
config.initial_rows = 35
config.prefer_egl = true
config.window_background_opacity = 0.85
config.text_background_opacity = 0
config.adjust_window_size_when_changing_font_size = true
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.color_scheme = "tokyonight"
config.enable_kitty_graphics=true

-- font
config.font_size = 14.0
config.font = wezterm.font("UDEV Gothic NFLG", { weight = "Regular", stretch = "Normal", style = "Normal" })

-- Leader key
config.leader = { key = ",", mods = "CTRL", time_millisecons = 1000 }

-- keybinds
config.disable_default_key_bindings = true
local keybind = require("keybinds")
config.keys = keybind.keys
config.key_tables = keybind.key_tables

return config
