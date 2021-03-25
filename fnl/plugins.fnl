(local install_path (.. (vim.fn.stdpath "data") :/site/pack/packer/start/packer.nvim))

; install packer automatically
(if (not= (vim.fn.empty (vim.fn.glob install_path)) 0)
  (do 
    (print "installing packer...")
    (vim.api.nvim_command (.. "!git clone https://github.com/wbthomason/packer.nvim " install_path))
    (vim.api.nvim_command "packadd packer.nvim")))

(local packer (require :packer))
(local util (require :packer.util))

(packer.init {
              :package_root (util.join_paths (vim.fn.stdpath "data") "site" "pack")
              })


(fn telescope-deps [use]
  (use "nvim-lua/plenary.nvim")
  (use "nvim-lua/popup.nvim")
  (use "nvim-lua/telescope.nvim")
  nil)

(fn lightline-deps [use]
  (use "itchyny/lightline.vim")             ; airline, but not so chunky
  (use "itchyny/vim-gitbranch")
  nil)             ; provides name of branch for lightline

(fn tpope [use]
  (use "tpope/vim-commentary")              ; commenting lines should be fast.
  (use "tpope/vim-repeat")                  ; repeat <plug> commands
  (use "tpope/vim-surround")                ; who said adding quotes and parenthesis had to be hard?
  nil)

(fn nvim-tree [use]
  (use "kyazdani42/nvim-web-devicons")      ; devicons for nvim-tree
  (use "kyazdani42/nvim-tree.lua")          ; like nerdtree, but better
  nil)


(packer.startup (fn []
  (use "wbthomason/packer.nvim") ; prevent packer from trying to suicide

  (use "morhetz/gruvbox")
  (lightline-deps use)


  (use "airblade/vim-gitgutter")
  (use "APZelos/blamer.nvim")

  (use { 1 "nvim-treesitter/nvim-treesitter"  :opt true })

  (use "sheerun/vim-polyglot")              ; more syntax highlighting
  
  (use "neovim/nvim-lspconfig")
  (use "nvim-lua/completion-nvim")
  (use "anott03/nvim-lspinstall")

  (telescope-deps use)
  (tpope use)

  (nvim-tree use)


  (use "unblevable/quick-scope")            ; highlight first letters of words to navigate the lines easier
  ; rust lsp
  (use "rust-lang/rust.vim")
  ; markdown
;   (use { 1 "iamcco/markdown-preview.nvim" :run "cd app && yarn install" }) ; add this dep if you like, you'll need yarn
  nil
  ))
nil
