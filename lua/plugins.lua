local install_path = (vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim")
if (vim.fn.empty(vim.fn.glob(install_path)) ~= 0) then
  print("installing packer...")
  vim.api.nvim_command(("!git clone https://github.com/wbthomason/packer.nvim " .. install_path))
  vim.api.nvim_command("packadd packer.nvim")
end
local packer = require("packer")
local util = require("packer.util")
packer.init({package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack")})
local function telescope_deps(use)
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-lua/telescope.nvim")
  return nil
end
local function lightline_deps(use)
  use("itchyny/lightline.vim")
  use("itchyny/vim-gitbranch")
  use("nvim-lua/lsp-status.nvim")
  return nil
end
local function tpope(use)
  use("tpope/vim-commentary")
  use("tpope/vim-repeat")
  use("tpope/vim-surround")
  return nil
end
local function nvim_tree(use)
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  return nil
end
local function _1_()
  use("wbthomason/packer.nvim")
  use("morhetz/gruvbox")
  lightline_deps(use)
  use("airblade/vim-gitgutter")
  use("APZelos/blamer.nvim")
  use({"nvim-treesitter/nvim-treesitter", opt = true})
  use("sheerun/vim-polyglot")
  use("neovim/nvim-lspconfig")
  use("nvim-lua/completion-nvim")
  use("anott03/nvim-lspinstall")
  telescope_deps(use)
  tpope(use)
  nvim_tree(use)
  use("unblevable/quick-scope")
  use("rust-lang/rust.vim")
  return nil
end
packer.startup(_1_)
return nil
