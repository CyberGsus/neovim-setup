local function map(mode, lhs, rhs, opts_3f)
  local options = {noremap = true}
  if opts_3f then
    options = vim.tbl_extend("force", options, opts_3f)
  end
  return vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
map("i", "<c-j>", "\\<c-n>", {expr = true})
map("i", "<c-j>", "\\<c-p>", {expr = true})
map("n", "<m-j>", ":resize -2<cr>")
map("n", "<m-k>", ":resize +2<cr>")
map("n", "<m-h>", ":vertial resize -2<cr>")
map("n", "<m-l>", ":vertial resize +2<cr>")
map("i", "jk", "<esc>")
map("i", "<tab>", "pumvisible() ? \"\\<c-n>\" : \"\\<tab>\"", {expr = true})
map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")
return map
