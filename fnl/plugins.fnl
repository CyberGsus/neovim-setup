(local install_path (.. (vim.fn.stdpath "data") :/site/pack/packer/start/packer.nvim))

; install packer automatically if not present
(if (not= (vim.fn.empty (vim.fn.glob install_path)) 0)
  (do
    (print "installing packer...")
    (vim.api.nvim_command (.. "!git clone https://github.com/wbthomason/packer.nvim" " " install_path))
    (vim.api.nvim_command "packadd packer.nvim")))

(local packer (require :packer))
(local util (require :packer.util))

(packer.init {
              :package_root (util.join_paths (vim.fn.stdpath "data") "site" "pack")
              })


(packer.startup (fn []
                  (use :wbthomason/packer.nvim) ; prevent packer from trying to suicide

                  (use { 1 :kyazdani42/nvim-tree.lua
                        :requires :kyazdani42/nvim-web-devicons})

                  (use :morhetz/gruvbox)

                  (use :tpope/vim-repeat)
                  (use :tpope/vim-surround)
                  (use :tpope/vim-fugitive)

                  (use :itchyny/lightline.vim)
                  (use :nvim-lua/lsp-status.nvim)

                  (use { 1 :nvim-lua/telescope.nvim
                        :requires [ :nvim-lua/plenary.nvim :nvim-lua/popup.nvim ]
                        :disabled true })

                  (use { 1 :junegunn/fzf
                        :run (. vim.fn :fzf#install)})
;                  (use :junegunn/fzf.vim)
                  (use :gfanto/fzf-lsp.nvim)

                  (use :b3nj5m1n/kommentary)


                  (use :airblade/vim-gitgutter)
                  (use :APZelos/blamer.nvim)

                  (use { 1 :nvim-treesitter/nvim-treesitter  :opt true })

                  (use :sheerun/vim-polyglot)              ; more syntax highlighting

                  (use :neovim/nvim-lspconfig)
                  (use :nvim-lua/completion-nvim)
                  (use :anott03/nvim-lspinstall)

                  (use :unblevable/quick-scope)            ; highlight first letters of words to navigate the lines easier
                  ; rust lsp
                  (use :rust-lang/rust.vim)
                  ; markdown
                  ;   (use { 1 "iamcco/markdown-preview.nvim" :run "cd app && yarn install" }) ; add this dep if you like, you'll need yarn
                  nil
                  ))
nil
