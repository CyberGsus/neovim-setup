vim.g["mapleader"] = ","
require("options")
vim.g["python3_host_prog"] = "/usr/bin/python3"
require("keys")
require("plugins")
require("plug-config")
local utils = require("utils")
vim.api.nvim_command("colorscheme gruvbox")
utils.options("global", {background = "dark"})
utils["set-globals"](utils["prefix-options"]({"gruvbox"}, {contrast_dark = "medium", italic = 1}))
return nil
