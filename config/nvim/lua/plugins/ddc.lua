local h = require("util.helper")

return {
	{
		"Shougo/ddc.vim",
		lazy = true,
		event = "InsertEnter",
		dependencies = {
			{ "vim-denops/denops.vim" },
			-- UI
			{ "Shougo/pum.vim" },
			{ "Shougo/ddc-ui-pum" },
			-- Source
			{ "Shougo/ddc-source-around" },
			{ "Shougo/ddc-source-lsp" },
			{ "Shougo/ddc-source-cmdline" },
			{ "LumaKernel/ddc-source-file" },
			-- Filter
			{ "tani/ddc-fuzzy" },
			-- Preview
			{ "uga-rosa/ddc-previewer-floating" },
		},
		config = function()
			local patch_global = vim.fn["ddc#custom#patch_global"]

			patch_global("ui", "pum")

			patch_global("autoCompleteEvents", {
				"InsertEnter",
				"TextChangedI",
				"TextChangedP",
				"CmdlineChanged",
			})

			patch_global("sources", {
				"around",
				"lsp",
				"file",
				"skkeleton",
			})

			patch_global("cmdlineSources", {
				[":"] = {
					"cmdline",
					"around",
				},
				["/"] = {
					"around",
				},
				["?"] = {
					"around",
				},
			})

			patch_global("sourceOptions", {
				_ = {
					matchers = { "matcher_fuzzy" },
					sorters = { "sorter_fuzzy" },
					converters = { "converter_fuzzy" },
				},

				around = {
					mark = "[A]",
				},

				lsp = {
					mark = "[LSP]",
					forceCompletionPattern = [[\.\w*|:\w*|->\w*]],
				},

				file = {
					mark = "[F]",
					isVolatile = true,
					forceCompletionPattern = [[\S/\S*]],
				},

				skkeleton = {
					mark = "[SKK]",
					matchers = {},
					sorters = {},
					converters = {},
					isVolatile = true,
					minAutoCompleteLength = 2,
				},

				cmdline = {
					mark = "[cmd]",
				},

				["cmdline-history"] = {
					mark = "[HIST]",
				},
			})
			vim.fn["ddc#enable"]()
			require("ddc_previewer_floating").enable()
		end,
	},
	{
		"Shougo/pum.vim",
		config = function()
			vim.fn["pum#set_option"]({
				auto_select = true,
				padding = true,
				border = "single",
				preview = false,
				scrollbar_char = "|",
				highlight_normal_menu = "Normal",
			})

			-- Insert
			vim.cmd(
				"imap <silent><expr> <TAB> pum#visible() ? '<cmd>call pum#map#insert_relative(+1)<CR>' : (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\\s') ? '<Tab>' : ddc#map#manual_complete()"
			)
			h.imap("<S-Tab>", "<cmd>call pum#map#insert_relative(-1)<CR>")
			h.imap("<C-n>", "<cmd>call pum#map#select_relative(+1)<CR>")
			h.imap("<C-p>", "<cmd>call pum#map#select_relative(-1)<CR>")
			h.imap("<C-y>", "<cmd>call pum#map#confirm()<CR>")
			h.imap("<C-e>", "<cmd>call pum#map#cancel()<CR>")

			-- Command
			vim.cmd(
				"cmap <silent><expr> <TAB> pum#visible() ? '<cmd>call pum#map#insert_relative(+1)<CR>' : (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\\s') ? '<Tab>' : ddc#map#manual_complete()"
			)
			h.cmap("<S-Tab>", "<cmd>call pum#map#insert_relative(-1)<CR>")
			h.cmap("<C-n>", "<cmd>call pum#map#select_relative(+1)<CR>")
			h.cmap("<C-p>", "<cmd>call pum#map#select_relative(-1)<CR>")
			h.cmap("<C-y>", "<cmd>call pum#map#confirm()<CR>")
			h.cmap("<C-e>", "<cmd>call pum#map#cancel()<CR>")
		end,
	},
	{
		"uga-rosa/ddc-previewer-floating",
		config = function()
			require("ddc_previewer_floating").setup({
				ui = "pum",
				border = "single",
				window_options = {
					wrap = false,
					number = false,
					signcolumn = "no",
					cursorline = false,
					foldenable = false,
					foldcolumn = "0",
				},
			})
		end,
	},
}
