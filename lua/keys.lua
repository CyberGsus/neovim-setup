local map = (require("utils")).map
local mapcmd = (require("utils"))["map-command"]
map("i", "<c-j>", "\\<c-n>", {expr = true})
map("i", "<c-j>", "\\<c-p>", {expr = true})
map("n", "<m-j>", ":resize -2<cr>")
map("n", "<m-k>", ":resize +2<cr>")
map("n", "<m-h>", ":vertical resize -2<cr>")
map("n", "<m-l>", ":vertical resize +2<cr>")
map("i", "jk", "<esc>")
map("v", "jk", "<esc>")
map("i", "<tab>", "pumvisible() ? \"\\<c-n>\" : \"\\<tab>\"", {expr = true})
map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")
mapcmd("n", "<leader>rc", "luafile ~/.config/nvim/init.lua", {silent = false})
return nil
