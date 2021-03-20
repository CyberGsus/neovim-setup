vim.g["mapleader"] = ","
vim.cmd("packadd paq-nvim")
local paq = (require("paq-nvim")).paq
paq({"savq/paq-nvim", opt = true})
paq({"shougo/deoplete-lsp"})
paq({"shougo/deoplete.nvim", hook = vim.fn["remote#host#UpdateRemotePlugins"]})
paq({"nvim-treesitter/nvim-treesitter"})
paq({"neovim/nvim-lspconfig"})
paq({"neovim-lua/completion-nvim"})
paq({"neovim-lua/lsp_extensions.nvim"})
paq({"junegunn/fzf", hook = vim.fn["fzf#install"]})
paq({"junegunn/fzf.vim"})
paq({"ojroques/nvim-lspfuzzy"})
paq({"sheerun/vim-polyglot"})
paq({"jiangmiao/auto-pairs"})
paq({"morhetz/gruvbox"})
paq({"tpope/vim-repeat"})
paq({"tpope/vim-surround"})
paq({"tpope/vim-commentary"})
paq({"nvim-telescope/telescope.nvim"})
paq({"itchyny/lightline.vim"})
paq({"ryanoasis/vim-devicons"})
paq({"airblade/vim-rooter"})
paq({"sharksforarms/vim-rust"})
vim.cmd("colorscheme gruvbox")
local scopes = {b = vim.bo, o = vim.o, w = vim.wo}
local function opt(scope, key, value)
  scopes[scope][key] = value
  if (scope ~= "o") then
    scopes.o[key] = value
    return nil
  end
end
local indent = 2
opt("b", "expandtab", true)
opt("b", "shiftwidth", indent)
opt("b", "smartindent", true)
opt("b", "tabstop", indent)
opt("o", "hidden", true)
opt("o", "ignorecase", true)
opt("o", "joinspaces", false)
opt("o", "scrolloff", 4)
opt("o", "shiftround", true)
opt("o", "sidescrolloff", 8)
opt("o", "smartcase", true)
opt("o", "splitbelow", true)
opt("o", "splitright", true)
opt("o", "termguicolors", true)
opt("o", "wildmode", "list:longest")
opt("w", "list", true)
opt("w", "number", true)
opt("w", "relativenumber", true)
opt("w", "wrap", false)
opt("o", "completeopt", "menuone,noinsert,noselect")
opt("o", "showmode", false)
local function map(mode, lhs, rhs, opts_3f)
  local options = {noremap = true}
  if opts_3f then
    options = vim.tbl_extend("force", options, opts)
  end
  return vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
map("", "<leader>c", "\"+y")
map("i", "<c-u>", "<c-g>u<c-u>")
map("i", "<c-w>", "<c-g>u<c-w>")
map("n", "<c-l>", "<cmd>noh<cr>")
map("i", "jk", "<esc>")
map("i", "<esc>", "<nop>")
vim.g["lightline"] = {active = {component = {charvaluehex = "0x%B", filename = "%f", modified = "%m"}, component_function = {gitbranch = "fugitive#head"}, left = {{"mode", "paste"}, {"cocstaus", "git", "readonly", "filename", "modified"}}, right = {{"lineinfo"}, {"charvaluehex"}, {"fileformat", "fileencoding", "filetype", "diagnostic"}}}, colorscheme = "gruvbox", separator = {left = "\238\130\176", right = "\238\130\178"}, subseparator = {left = "\238\130\177", right = "\238\130\179"}}
local ts = require("nvim-treesitter.configs")
ts.setup({ensure_installed = "maintained", highlight = {enable = true}})
local lsp = require("lspconfig")
local lspfuzzy = require("lspfuzzy")
lsp.ccls.setup({})
lspfuzzy.setup({})
map("n", "<space>,", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
map("n", "<space>;", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
map("n", "<space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<space>d", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
map("n", "<space>h", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "<space>m", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<space>r", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<space>s", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
vim.g["fzf_action"] = {["ctrl-t"] = "tab split", ["ctrl-v"] = "vsplit", ["ctrl-x"] = "split"}
vim.g["fzf_history_dir"] = "~/.local/share/fzf-history"
map("", "<leader>f", ":Files<cr>")
map("", "<leader>b", ":Buffers<cr>")
map("n", "<leader>g", ":Rg<cr>")
map("n", "<leader>t", ":Tags<cr>")
map("n", "<leader>m", ":Marks<cr>")
return nil
