-- Option --
local options = {
	helplang = "ja",
	termguicolors = true,
	winblend = 5,
	pumblend = 5,
	encoding = "utf-8",
	fileencoding = "utf-8",
	title = true,
	backup = false,
	swapfile = false,
	writebackup = false,
	undofile = false,
	hidden = true,
	clipboard = "unnamedplus",
	number = true,
	relativenumber = true,
	wrap = true,
	showmatch = true,
	showtabline = 2,
	updatetime = 300,
	timeoutlen = 300,
	expandtab = true,
	autoindent = true,
	smartindent = true,
	tabstop = 2,
	shiftwidth = 2,
	wildmenu = true,
	cmdheight = 1,
	laststatus = 2,
	showcmd = true,
	hlsearch = true,
	incsearch = true,
	matchtime = 1,
}

for i, j in pairs(options) do
	vim.opt[i] = j
end

-- Terminal --
vim.cmd("autocmd TermOpen * :startinsert")
vim.cmd("autocmd TermOpen * setlocal norelativenumber")
vim.cmd("autocmd TermOpen * setlocal nonumber")
