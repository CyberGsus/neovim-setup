local map = require("keys/map_fn")
map("n", "<c-n>", ":NvimTreeToggle<cr>")
return map("n", "<leader>r", ":NvimTreeRefresh<cr>")
