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
					theme = "tokyonight",
					component_separators = { left = "|", right = "|" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {},
					always_divide_middle = true,
					colored = false,
					globalstatus = true,
				},

        sections = {
          lualine_a = {"mode"},
          lualine_b = {"branch", "diff"},
          lualine_c = {
            {
              "filename",
              path = 1,
              file_status = true,
              shorting_target = 40,
              symbols = {
                modified = " [+]",
                readonly = " [RO]",
                unnamed = "Untitled",
              },
            },
          },
          lualine_x = {
            {"searchcount"},
            {
              "diagnostics",
              sources = {"nvim_lsp"},
              sections = {"error", "warn", "info", "hint"},
              diagnostics_color = {
                error = "DiagnosticError",
                warn = "DiagnosticWarn",
                info = "DiagnosticInfo",
                hint = "DiagnosticHint",
              },
              symbols = {error = "E", warn = "W", info = "I", hint = "H"},
              colored = true,
              update_in_insert = false,
              always_visible = false,
            }
          },
          lualine_y = {"filetype", "encoding"},
          lualine_z = {"location", "progress"},
        },

				tabline = {
					lualine_a = {
						{
							"buffers",
							mode = 4,
							icons_enabled = true,
							show_filename_only = true,
							hide_filename_extensions = false,
						},
					},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "tabs" },
				},

				extensions = {},
			}),
		}
	end,
}
