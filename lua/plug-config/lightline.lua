local utils = require("utils")
vim.cmd("\nfunction! GitHead()\nlet head = FugitiveHead()\nif strchars(head) == 0\n return ''\nend\nreturn '\239\144\152 ' . head\nendfunction")
utils["set-global"]("lightline", {active = {left = {{"mode", "paste"}, {"gitbranch", "filename", "modified", "lsp"}}, right = {{"lineinfo"}, {"filetype"}}}, colorscheme = "gruvbox", component_function = {gitbranch = "GitHead", lsp = "LspStatus"}, separator = {left = "\238\130\176", right = "\238\130\178"}, subseparator = {left = "\238\130\177", right = "\238\130\179"}})
return nil
