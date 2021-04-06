local utils = require("utils")
vim.cmd("\n         function! GitHead()\n         let head = FugitiveHead()\n         if strchars(head) == 0\n         return ''\n         end\n         return '\239\144\152 ' . head\n         endfunction")
return utils["set-global"]("lightline", {active = {left = {{"mode", "paste"}, {"gitbranch", "filename", "modified", "lsp"}}, right = {{"lineinfo"}, {"filetype"}, {"charvaluehex"}}}, colorscheme = "gruvbox", component = {charvaluehex = "0x%B"}, component_function = {gitbranch = "GitHead", lsp = "LspStatus"}, separator = {left = "\238\130\176", right = "\238\130\178"}, subseparator = {left = "\238\130\177", right = "\238\130\179"}})
