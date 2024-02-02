return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = true,
	event = "VimEnter",
	config = function()
		return {
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "dracula",
					component_separators = { left = "|", right = "|" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {},
					always_divide_middle = true,
					colored = false,
				},
			}),
		}
	end,
}
