local h = require("util.helper")

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
		-- Source
		{ "matsui54/ddu-source-help" },
		-- Filter
		{ "Shougo/ddu-filter-matcher_substring" },
	},
	config = function()
		---@diagnostic disable-next-line: undefined-global
		vim.fn["ddu#custom#patch_global"]({
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

		vim.fn["ddu#custom#patch_local"]("help-ff", {
			sources = {
				{ name = "help" },
			},
		})

		---@diagnostic disable-next-line: undefined-global
		local ddu_do_action = vim.fn["ddu#ui#do_action"]

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
				---@diagnostic disable-next-line: undefined-global
				vim.cmd.stopinsert()
				ddu_do_action("closeFilterWindow")
			end, { buffer = true })
			h.nmap("<CR>", function()
				---@diagnostic disable-next-line: undefined-global
				vim.cmd.stopinsert()
				ddu_do_action("closeFilterWindow")
			end, { buffer = true })
		end

		---@diagnostic disable-next-line: undefined-global
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "ddu-ff",
			callback = ddu_ff_keymaps,
		})

		---@diagnostic disable-next-line: undefined-global
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "ddu-ff-filter",
			callback = ddu_ff_filetr_keymaps,
		})

		---@diagnostic disable-next-line: undefined-global
		vim.api.nvim_create_user_command("Help", function()
			---@diagnostic disable-next-line: undefined-global
			vim.fn["ddu#start"]({ name = "help-ff" })
		end, {})
	end,
}
