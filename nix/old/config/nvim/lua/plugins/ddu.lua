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
		{ "Shougo/ddu-ui-filer" },
    { "ryota2357/ddu-column-icon_filename" },
		-- Source
		{ "Shougo/ddu-source-file" },
		{ "Shougo/ddu-kind-file" },
		{ "Shougo/ddu-column-filename" },
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

		fn["ddu#custom#patch_local"]("filer", {
			ui = "filer",
			sources = {
				{
					name = "file",
					params = {
						ignoreDirectories = { ".git", "node_modules", ".venv" },
					},
				},
			},
			sourceOptions = {
				_ = {
					columns = { "icon_filename" },
				},
			},
			kindOptions = {
				file = {
					defaultAction = "open",
				},
			},
			actionOptions = {
				narrow = {
					quit = false,
				},
			},
			uiParams = {
				filer = {
					startAutoAction = true,
					autoAction = {
						delay = 0,
						name = "preview",
					},
          displayRoot = false,
					split = "floating",
					floatingBorder = "rounded",
					winWidth = "&columns / 2 -3",
					winHeight = "&lines -3",
					winRow = 0,
					winCol = 1,
					previewFloating = true,
          previewFloatingBorder = "rounded",
					previewWidth = "&columns / 2 -3",
					previewHeight = "&lines - 3",
					previewRow = 3,
					previewCol = "&columns / 2",
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

		-- ------------------------------------------------
		-- ui_ff
		-- ------------------------------------------------
		local ff_do_action = fn["ddu#ui#do_action"]
		local function ddu_ff_keymaps()
			h.nmap("<CR>", function()
				ff_do_action("itemAction")
			end, { buffer = true })
			h.nmap("v", function()
				ff_do_action("itemAction", {
					name = "open",
					params = { command = "vsplit" },
				})
			end, { buffer = true })
			h.nmap("t", function()
				ff_do_action("itemAction", {
					name = "open",
					params = { command = "tabedit" },
				})
			end, { buffer = true })
			h.nmap("i", function()
				ff_do_action("openFilterWindow")
			end, { buffer = true })
			h.nmap("q", function()
				ff_do_action("quit")
			end, { buffer = true })
			h.nmap("<ESC>", function()
				ff_do_action("quit")
			end, { buffer = true })
		end

		local function ddu_ff_filetr_keymaps()
			h.imap("<CR>", function()
				cmd.stopinsert()
				ff_do_action("closeFilterWindow")
			end, { buffer = true })
			h.nmap("<CR>", function()
				cmd.stopinsert()
				ff_do_action("closeFilterWindow")
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

		-- ------------------------------------------------
		-- ui_filer
		-- ------------------------------------------------
		local filer_do_action = fn["ddu#ui#do_action"]
		local get_item = fn["ddu#ui#get_item"]
		local function ddu_filer_keymaps()
			h.nmap("<CR>", function()
				if get_item()["isTree"] then
					filer_do_action("expandItem", { mode = "toggle" })
				else
					filer_do_action("itemAction")
				end
			end, { buffer = true })

			h.nmap("l", function()
				filer_do_action("expandItem", {
					mode = "toggle",
				})
        filer_do_action("preview")
			end, { buffer = true })

			h.nmap("h", function()
				filer_do_action("itemAction", {
					name = "narrow",
					params = { path = ".." },
				})
        filer_do_action("preview")
			end, { buffer = true })

      vim.cmd("nmap j j<cmd>call ddu#ui#do_action('preview')<CR>")
      vim.cmd("nmap k k<cmd>call ddu#ui#do_action('preview')<CR>")

			h.nmap(";", function()
				filer_do_action("togglePreview")
			end, { buffer = true })

			h.nmap("v", function()
				filer_do_action("itemAction", {
					name = "open",
					params = { command = "vsplit" },
				})
			end, { buffer = true })

			h.nmap("t", function()
				filer_do_action("itemAction", {
					name = "open",
					params = { command = "tabedit" },
				})
			end, { buffer = true })

			h.nmap("<ESC>", function()
				filer_do_action("quit")
			end, { buffer = true })

			h.nmap("q", function()
				filer_do_action("quit")
			end, { buffer = true })

			h.nmap("..", function()
				filer_do_action("itemAction", {
					name = "narrow",
					params = { path = ".." },
				})
			end, { buffer = true })

			h.nmap("p", function()
				filer_do_action("itemAction", { name = "paste" })
			end, { buffer = true })

			h.nmap("c", function()
				filer_do_action("itemAction", { name = "copy" })
			end, { buffer = true })

			h.nmap("d", function()
				filer_do_action("itemAction", { name = "delete" })
			end, { buffer = true })

			h.nmap("r", function()
				filer_do_action("itemAction", { name = "rename" })
			end, { buffer = true })

			h.nmap("y", function()
				filer_do_action("itemAction", { name = "yank" })
			end, { buffer = true })

			h.nmap("mv", function()
				filer_do_action("itemAction", { name = "move" })
			end, { buffer = true })

			h.nmap("n", function()
				filer_do_action("itemAction", { name = "newFile" })
			end, { buffer = true })

			h.nmap("mk", function()
				filer_do_action("itemAction", { name = "newDirectory" })
			end, { buffer = true })
		end
		api.nvim_create_autocmd("FileType", {
			pattern = "ddu-filer",
			callback = ddu_filer_keymaps,
		})
		api.nvim_create_user_command("File", function()
			fn["ddu#start"]({
				name = "filer",
				searchPath = fn["expand"]("%:p"),
			})
		end, {})
	end,
}
