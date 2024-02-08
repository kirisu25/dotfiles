local M = {}
local h = require("util.helper")

local function set_indent(tab_length, is_hard_tab)
	if is_hard_tab then
		vim.bo.expandtab = false
	else
		vim.bo.expandtab = true
	end

	vim.bo.shiftwidth = tab_length
	vim.bo.softtabstop = tab_length
	vim.bo.tabstop = tab_length
end

M.go = function()
	set_indent(2, true)
	h.nmap("<Leader>gt", "<cmd>bo term go test <CR>")
	h.nmap("<Leader>run", "<cmd>bo term go run <CR>")
end

M.rust = function()
	set_indent(4, false)
	h.nmap("<Leader>run", "<cmd>bo term cargo run<CR>")
	h.nmap("<Leader>ch", "<cmd>bo term cargo check<CR>")
	h.nmap("<Leader>ct", "<cmd>bo term cargo test<CR>")
end

local ft = setmetatable(M, {
	__index = function()
		return function()
			set_indent(2, false)
		end
	end,
})

vim.api.nvim_create_augroup("ft_augroup", {})
vim.api.nvim_create_autocmd("Filetype", {
	group = "ft_augroup",
	pattern = "*",
	callback = function(args)
		ft[args.match]()
	end,
})
