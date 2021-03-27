local utils = require("utils")
utils.options("global", {background = "dark", backup = false, clipboard = "unnamedplus", cmdheight = 2, completeopt = "menuone,noinsert,noselect", encoding = "utf-8", hidden = true, hlsearch = false, ignorecase = true, laststatus = 2, mouse = "nicr", pumheight = 10, ruler = true, showmode = false, showtabline = 2, smartcase = true, smarttab = true, splitbelow = true, t_Co = "256", timeoutlen = 500, updatetime = 300, wildmode = "list:longest", writebackup = false})
utils.options("window", {conceallevel = 0, cursorline = true, list = true, number = true, relativenumber = true, signcolumn = "number", wrap = false})
utils.options("buffer", {autoindent = true, expandtab = true, shiftwidth = indent, smartindent = true, tabstop = indent})
vim.api.nvim_command("\naugroup MakefileSpecial\nautocmd FileType makefile set noet\naugroup end")
return nil
