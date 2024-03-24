local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local act = wezterm.action

-- Terminal
config.initial_cols = 160
config.initial_rows = 35
config.prefer_egl = true
config.window_background_opacity = 0.8
config.text_background_opacity = 1
config.adjust_window_size_when_changing_font_size = true
config.enable_tab_bar = true
config.color_scheme = "nord"

-- font
config.font_size = 14.0
--config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font = wezterm.font_with_fallback({
  { family = "JetBrainsMono Nerd Font", weight = "Regular" },
  { family = "JetBrainsMono Nerd Font", weight = "Regular", assume_emoji_presentation = true },
  { family = "Noto Sans CJK JP" },
})

-- Leader key
config.leader = { key = ",", mods = "CTRL", time_millisecons = 1000 }

-- keybinds
config.disable_default_key_bindings = true
local keybind = require("keybinds")
config.keys = keybind.keys
config.key_tables = keybind.key_tables

return config
