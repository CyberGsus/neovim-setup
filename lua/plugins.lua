do
  local data_path = vim.fn.stdpath("data")
  local install_path = (data_path .. "/site/pack/packer/start/packer.nvim")
  local expanded_path = vim.fn.glob(install_path)
  if (vim.fn.empty(expanded_path) ~= 0) then
    print("installing packer...")
    vim.api.nvim_command(("!git clone https://github.com/wbthomason/packer.nvim " .. install_path))
    vim.api.nvim_command("packadd packer.nvim")
  end
end
local packer = require("packer")
local function packer_startup(use)
  use("wbthomason/packer.nvim")
  use("arcticicestudio/nord-vim")
  use("phaazon/hop.nvim")
  use("nvim-treesitter/nvim-treesitter")
  use({"hoob3rt/lualine.nvim", requires = "kyazdani42/nvim-web-devicons"})
  use({"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons"})
  use("jiangmiao/auto-pairs")
  use("tpope/vim-repeat")
  use("tpope/vim-surround")
  use("tpope/vim-fugitive")
  use("b3nj5m1n/kommentary")
  use({"junegunn/fzf", run = vim.fn["fzf#install"]})
  use("junegunn/fzf.vim")
  use("nvim-lua/lsp-status.nvim")
  use("neovim/nvim-lspconfig")
  use("nvim-lua/completion-nvim")
  use({"folke/lsp-trouble.nvim", requires = "kyazdani42/nvim-web-devicons"})
  use("folke/lsp-colors.nvim")
  return nil
end
packer.startup(packer_startup)
require("plug-config/theme")
require("plug-config/kommentary")
require("plug-config/lualine")
require("plug-config/nvim-lsp")
require("plug-config/hop")
require("plug-config/treesitter")
require("plug-config/keys/fzf")
require("plug-config/keys/lsp")
require("plug-config/keys/vim-fugitive")
require("plug-config/keys/lsp-trouble")
require("plug-config/keys/hop")
require("plug-config/keys/nvim-tree")
return nil
