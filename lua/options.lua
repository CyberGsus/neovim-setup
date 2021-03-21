local scopes = {buffer = vim.bo, global = vim.o, window = vim.wo}
local function options(scope, kvpairs)
  for k, v in pairs(kvpairs) do
    scopes[scope][k] = v
  end
  return nil
end
local indent = 2
options("global", {background = "dark", backup = false, clipboard = "unnamedplus", cmdheight = 2, encoding = "utf-8", hidden = true, hlsearch = false, ignorecase = true, laststatus = 2, mouse = "nicr", pumheight = 10, ruler = true, showmode = false, showtabline = 2, smartcase = true, smarttab = true, splitbelow = true, t_Co = "256", timeoutlen = 500, updatetime = 300, wildmode = "list:longest", writebackup = false})
options("window", {conceallevel = 0, cursorline = true, list = true, number = true, relativenumber = true, signcolumn = "number", wrap = false})
return options("buffer", {autoindent = true, shiftwidth = indent, smartindent = true, tabstop = indent})
