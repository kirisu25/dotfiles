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
	},
	dependencies = {
		{ "vim-denops/denops.vim" },
		-- UI
		{ "Shougo/ddu-ui-ff" },
		{ "Shougo/ddu-ui-filer" },
		-- Source
		{ "Shougo/ddu-source-file" },
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
					startFilter = true,
					winWidth = "&columns / 2 -2",
					previewFloating = true,
					previewHeight = "&lines - 8",
					previewWidth = "&columns /2 -2",
					previewRow = 1,
					previewCol = "&columns /2 + 1",
				},
			},
			sourceOptions = {
				_ = {
					matchers = { "matcher_substring" },
				},
				help = {
					defaultAction = "open",
				},
			},
		})
		-- local ui = function()
		-- 	local top = 4
		-- 	local width = vim.opt.columns:get()
		-- 	local height = vim.opt.lines:get()
		-- 	fn["ddu#custom#patch_global"]({
		-- 		ui = "ff",
		-- 		uiParams = {
		-- 			_ = {
		-- 				winWidth = math.floor(width * 0.8),
		-- 				winHeight = math.floor(height * 0.8),
		-- 				winCol = math.floor((width - (math.floor(width * 0.8) / 2))),
		-- 				winRow = top,
		-- 				split = "floating",
		-- 				floatingBorder = "single",
		-- 				preview = true,
		-- 				previewFloating = true,
		-- 				previewFloatingBorder = "single",
		-- 				previewSplit = "vertical",
		-- 				previewWidth = math.floor(math.floor(width * 0.8) * 0.5),
		-- 				previewHeight = math.floor(height * 0.8) - 2,
		-- 				previewCol = math.floor(width / 2) - 2,
		-- 				previewRow = top + 1,
		-- 			},
		-- 			ff = {
		-- 				filterSplitDirection = "floating",
		-- 				filterFloatingPosition = "top",
		-- 				autoResize = false,
		-- 				ignoreEmpty = false,
		-- 			},
		-- 			filter = {},
		-- 		},
		-- 	})
		-- end
		-- ui()
		-- api.nvim_create_autocmd("VimResized", {
		-- 	pattern = "*",
		-- 	callback = ui,
		-- })

		fn["ddu#custom#patch_local"]("help-ff", {
			sources = {
				{ name = "help" },
			},
		})

		local ddu_do_action = fn["ddu#ui#do_action"]

		local function ddu_ff_keymaps()
			h.nmap("<CR>", function()
				ddu_do_action("itemAction")
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
	end,
}
