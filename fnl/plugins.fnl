(vim.cmd "packadd packer.nvim")

(local packer (require :packer))
(local util (require :packer.util))

(packer.init {
              :package_root (util.join_paths (vim.fn.stdpath "data") "site" "pack")
              })


;; very inspired by https://github.com/codicocodes/dotfiles/blob/main/nvim/lua/plugins_setup.lua
(fn packer_startup []
  (use "morhetz/gruvbox")
  (use "airblade/vim-gitgutter")
  (use "APZelos/blamer.nvim")
  (use "nvim-treesitter/nvim-treesitter" { :opt true })
  (use "sheerun/vim-polyglot")
  
  (use "neovim/nvim-lspconfig")
  (use "nvim-lua/completion-nvim")
  (use "anott03/nvim-lspinstall")
  (use "nvim-lua/popup.nvim")
  ; telescope
  (use "nvim-lua/plenary.nvim")
  (use "nvim-lua/telescope.nvim")
  (use "jremmen/vim-ripgrep")
  ; ~telescope
  (use "itchyny/lightline.vim")
  (use "itchyny/vim-gitbranch")
  (use "kyazdani42/nvim-web-devicons")
  (use "kyazdani42/nvim-tree.lua")
  (use "tpope/vim-commentary")
  (use "tpope/vim-repeat")
  (use "tpope/vim-surround")
  (use "unblevable/quick-scope")
  ; rust lsp
  (use "rust-lang/rust.vim")
  )



(packer.startup packer_startup)

; (paq { 1 :savq/paq-nvim  :opt true })
; (paq { 1 :shougo/deoplete-lsp })
; (paq { 1 :shougo/deoplete.nvim :hook (. vim.fn :remote#host#UpdateRemotePlugins) })
; (paq { 1 :nvim-treesitter/nvim-treesitter })
; (paq { 1 :neovim/nvim-lspconfig })
; (paq { 1 :neovim-lua/completion-nvim })
; (paq { 1 :neovim-lua/lsp_extensions.nvim })
; (paq { 1 :junegunn/fzf :hook (. vim.fn "fzf#install") })
; (paq { 1 :junegunn/fzf.vim })
; (paq { 1 :ojroques/nvim-lspfuzzy })
; (paq { 1 :sheerun/vim-polyglot})
; (paq { 1 :jiangmiao/auto-pairs})
; (paq { 1 :morhetz/gruvbox })
; (paq { 1 :tpope/vim-repeat })
; (paq { 1 :tpope/vim-surround })
; (paq { 1 :tpope/vim-commentary })
; (paq { 1 :itchyny/lightline.vim })
; (paq { 1 :ryanoasis/vim-devicons })
; (paq { 1 :airblade/vim-rooter })
; (paq { 1 :rust-lang/rust.vim })
; (paq { 1 :unblevable/quick-scope })

; ; telescope
; (paq { 1 :nvim-lua/popup.nvim })
; (paq { 1 :nvim-lua/plenary.nvim })
; (paq { 1 :nvim-telescope/telescope.nvim })
