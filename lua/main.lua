vim.g["mapleader"] = ","
require("plugins")
vim.cmd("colorscheme gruvbox")
local option = require("options")
vim.g["python3_host_prog"] = "/usr/bin/python3"
local map = require("mappings")
local ts = require("nvim-treesitter.configs")
ts.setup({ensure_installed = "maintained", highlight = {enable = true}})
local nvim_lsp = require("lspconfig")
local completion = require("completion")
nvim_lsp.rust_analyzer.setup({on_attach = completion.on_attach})
nvim_lsp.ccls.setup({on_attach = completion.on_attach})
vim.g["lightline"] = {active = {component = {charvaluehex = "0x%B", filename = "%f", modified = "%m"}, component_function = {gitbranch = "fugitive#head"}, left = {{"mode", "paste"}, {"cocstaus", "gitbranch", "readonly", "filename", "modified"}}, right = {{"lineinfo"}, {"charvaluehex"}, {"fileformat", "fileencoding", "filetype", "diagnostic"}}}, colorscheme = "gruvbox", separator = {left = "\238\130\176", right = "\238\130\178"}, subseparator = {left = "\238\130\177", right = "\238\130\179"}}
map("n", "<space>,", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
map("n", "<space>;", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
map("n", "<space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<space>d", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
map("n", "<space>h", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "<space>m", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<space>r", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<space>s", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
local tp = require("telescope")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
tp.setup({defaults = {mappings = {i = {["<esc>"] = actions.close}}}})
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
local function nvim_tree_options(options)
  for name, opt in pairs(options) do
    vim.g[("nvim_tree_" .. name)] = opt
  end
  return nil
end
nvim_tree_options({add_trailing = 1, auto_close = 1, auto_open = 1, disable_netrw = 1, follow = 1, git_hl = 1, hide_dotfiles = 0, hijack_netrw = 1, ignore = {".git", ".node_modules", ".cache"}, indent_markers = 1, quit_on_open = 1, show_icons = {files = 0, folders = 0, git = 1}, side = "left", tree_icons = {default = "\238\152\146 ", folder = {default = "\238\151\191 ", empty = "\239\132\148 ", empty_open = "\239\132\149 ", open = "\238\151\190 ", symlink = "\239\146\130 ", symlink_open = "\238\151\190 "}, git = {renamed = "\226\158\156 ", staged = "\226\156\147 ", unmerged = "\238\156\167 ", unstaged = "\226\156\151 ", untracked = "\226\152\133 "}, symlink = "\239\146\129 "}, width = 30, width_allow_resize = 1})
map("n", "<c-n>", ":NvimTreeToggle<cr>")
map("n", "<leader>r", ":NvimTreeRefresh<cr>")
return nil
