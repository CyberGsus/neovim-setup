vim.g["mapleader"] = ","
vim.cmd("colorscheme gruvbox")
require("options")
vim.g["python3_host_prog"] = "/usr/bin/python3"
require("plugins")
require("plug-config")
require("keys")
return nil
