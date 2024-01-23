local h = require("util.helper")

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Select all
h.nmap("<Leader>a", "gg<S-v>G")

-- move
h.nmap("j", "gj")
h.nmap("k", "gk")

-- save and quit
h.nmap("<Leader>q", ":q<Return>")
h.nmap("<Leader>w", ":w<Return>")
h.nmap("<Leader>nq", ":q!<Return>")

-- etc
h.nmap("<ESC><ESC>", ":nohlsearch<CR>")

-- Insert --
h.imap("jj", "<ESC>")

-- Terminal --
h.tmap("<ESC>", "<C-\\><C-n>")
h.nmap("<Leader>t", ":bo terminal<CR>")
