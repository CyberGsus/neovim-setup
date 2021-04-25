local utils = require("utils")
local indent = 2
utils.options("global", {backup = false, clipboard = "unnamedplus", cmdheight = 2, completeopt = "menuone,noinsert,noselect", encoding = "utf-8", hidden = true, hlsearch = false, ignorecase = true, laststatus = 2, mouse = "nicr", pumheight = 10, ruler = true, showmode = false, showtabline = 2, smartcase = true, smarttab = true, splitbelow = true, t_Co = "256", termguicolors = true, timeoutlen = 500, updatetime = 300, wildmode = "list:longest", writebackup = false})
utils.options("window", {conceallevel = 0, cursorline = true, list = true, number = true, relativenumber = true, signcolumn = "number", wrap = false})
utils.options("buffer", {autoindent = true, expandtab = true, shiftwidth = indent, smartindent = true, tabstop = indent})
vim.cmd("augroup MakefileSpecial")
vim.cmd("autocmd!")
vim.cmd("autocmd BufEnter makefile set noet")
vim.cmd("autocmd BufLeave makefile set et")
vim.cmd("augroup END")
return nil
