local h = require("util.helper")
---@diagnostic disable-next-line: undefined-global
local fn = vim.fn
---@diagnostic disable-next-line: undefined-global
local cmd = vim.cmd
---@diagnostic disable-next-line: undefined-global
local api = vim.api

return {
	"Shougo/ddu.vim",
	lazy = true,
	cmd = {
		"Help",
		"File",
	},
	dependencies = {
		{ "vim-denops/denops.vim" },
		-- UI
		{ "Shougo/ddu-ui-ff" },
		-- Source
		{ "Shougo/ddu-source-file" },
		{ "Shougo/ddu-kind-file" },
		{ "matsui54/ddu-source-help" },
		-- Filter
		{ "Shougo/ddu-filter-matcher_substring" },
	},
	config = function()
		fn["ddu#custom#patch_global"]({
			ui = "ff",
			uiParams = {
				ff = {
					startAutoAction = true,
					autoAction = {
						delay = 0,
						name = "preview",
					},
					split = "vertical",
					splitDirection = "topleft",
					--					startFilter = true,
					winWidth = "&columns / 2 -2",
					previewFloating = true,
					previewHeight = "&lines - 2",
					previewWidth = "&columns /2 -2",
					previewRow = 1,
					previewCol = "&columns /2 + 1",
				},
			},
			sourceOptions = {
				_ = {
					matchers = { "matcher_substring" },
				},
			},
		})

		fn["ddu#custom#patch_local"]("file", {
			sources = {
				{ name = "file" },
			},
			sourceOptions = {
				file = {
					defaultAction = "open",
					-- path = fn["expand"]("~/"),
				},
			},
		})

		fn["ddu#custom#patch_local"]("help-ff", {
			sources = {
				{ name = "help" },
			},
			sourceOptions = {
				help = {
					defaultAction = "open",
				},
			},
			uiParams = {
				_ = {
					startFilter = true,
					startAutoAction = true,
					autoAction = {
						delay = 0,
						name = "preview",
					},
				},
			},
		})

		local ddu_do_action = fn["ddu#ui#do_action"]

		local function ddu_ff_keymaps()
			h.nmap("<CR>", function()
				ddu_do_action("itemAction")
			end, { buffer = true })
			h.nmap("v", function()
				ddu_do_action("itemAction", {
					name = "open",
					params = { command = "vsplit" },
				})
			end, { buffer = true })
			h.nmap("t", function()
				ddu_do_action("itemAction", {
					name = "open",
					params = { command = "tabedit" },
				})
			end, { buffer = true })
			h.nmap("i", function()
				ddu_do_action("openFilterWindow")
			end, { buffer = true })
			h.nmap("q", function()
				ddu_do_action("quit")
			end, { buffer = true })
		end

		local function ddu_ff_filetr_keymaps()
			h.imap("<CR>", function()
				cmd.stopinsert()
				ddu_do_action("closeFilterWindow")
			end, { buffer = true })
			h.nmap("<CR>", function()
				cmd.stopinsert()
				ddu_do_action("closeFilterWindow")
			end, { buffer = true })
		end

		api.nvim_create_autocmd("FileType", {
			pattern = "ddu-ff",
			callback = ddu_ff_keymaps,
		})

		api.nvim_create_autocmd("FileType", {
			pattern = "ddu-ff-filter",
			callback = ddu_ff_filetr_keymaps,
		})

		api.nvim_create_user_command("Help", function()
			fn["ddu#start"]({ name = "help-ff" })
		end, {})

		api.nvim_create_user_command("File", function()
			fn["ddu#start"]({ name = "file" })
		end, {})
	end,
}
