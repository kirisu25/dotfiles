local wezterm = require("wezterm")

local scrollback_lines = 20000
local act = wezterm.action


return {

    -- Terminal
    initial_cols = 160,
    initial_rows = 35,
    prefer_egl = true,
    window_background_opacity = 0.898,
    text_background_opacity = 0,
    adjust_window_size_when_changing_font_size = true,
    enable_tab_bar = true,
    color_scheme = "nord",

    -- font
    font_size = 12.0,
		font = wezterm.font("HackGen", {weight="Regular", stretch="Normal", style="Normal"})

    -- Key config
    leader = { key = "Space", mods = "SHIFT", time_millisecons = 1000 },
    keys = {
        -- Resize Pane
        {
            key = 'r',
            mods = 'LEADER',
            action = act.ActivateKeyTable {
                name = 'resize_pane',
                one_shot = false,
            },
        },
        -- Move Pane
        {
            key = 'p',
            mods = 'LEADER',
            action = act.ActivateKeyTable {
                name = 'activate_pane',
                timeout_milliseconds = 1000,
            },
        },
        -- Split Horizontal
        {
            key = '|',
            mods = 'LEADER|SHIFT',
            action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
        },
        -- Split Vertical
        {
            key = '-',
            mods = 'LEADER|SHIFT',
            action = act.SplitVertical { domain = 'CurrentPaneDomain' },
        },
    },

    key_tables = {
        resize_pane = {
            { key = 'h', action = act.AdjustPaneSize {"LEFT", 1} },
            { key = 'j', action = act.AdjustPaneSize {"Down", 1} },
            { key = 'k', action = act.AdjustPaneSize {"Up", 1} },
            { key = 'l', action = act.AdjustPaneSize {"Right", 1} },
            { key = 'Escape', action = "PopKeyTable" },
        },
        activate_pane = {
            { key = 'h', action = act.ActivatePaneDirection 'Left' },
            { key = 'j', action = act.ActivatePaneDirection 'Down' },
            { key = 'k', action = act.ActivatePaneDirection 'Up' },
            { key = 'l', action = act.ActivatePaneDirection 'Right' },
        },
    },
}
