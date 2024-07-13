return {
	"folke/tokyonight.nvim",
	lazy = true,
	event = "VimEnter",
	priority = 1000,
	opts = {
		style = "night",
		transparent = false,
		terminal_colors = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
    hide_inactive_statusline = true,
	},
	config = function()
		vim.cmd([[colorscheme tokyonight-moon]])
	end,
}
