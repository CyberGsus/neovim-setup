local utils = require("utils")
local options = {italic = 1}
utils["set-globals"](utils["prefix-options"]({"nord"}, options))
vim.api.nvim_command("colorscheme nord")
return nil
