local map = (require("utils")).map
local mapcmd = (require("utils"))["map-command"]
map("i", "<c-j>", "\\<c-n>", {expr = true})
map("i", "<c-j>", "\\<c-p>", {expr = true})
map("n", "<m-j>", "<c-w>j")
map("n", "<m-k>", "<c-w>k")
map("n", "<m-h>", "<c-w>h")
map("n", "<m-l>", "<c-w>l")
map("i", "jk", "<esc>")
map("v", "jk", "<esc>")
map("i", "<tab>", "pumvisible() ? \"\\<c-n>\" : \"\\<tab>\"", {expr = true})
map("v", "<", "<gv")
map("v", ">", ">gv")
mapcmd("n", "<leader>w", "update")
mapcmd("n", "<c-j>", "cprev")
mapcmd("n", "<c-k>", "cnext")
mapcmd("n", "<leader>j", "lprev")
mapcmd("n", "<leader>k", "lnext")
mapcmd("n", "<leader>rc", "lua require('main')")
return nil
