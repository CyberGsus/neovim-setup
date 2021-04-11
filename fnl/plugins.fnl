; install & load packer if not present
(let [ data-path (vim.fn.stdpath :data)
      install-path (.. data-path :/site/pack/packer/start/packer.nvim) 
      expanded-path (vim.fn.glob install-path) ]
  (when (not= (vim.fn.empty expanded-path) 0)
    (print "installing packer...")
    (vim.api.nvim_command (.. "!git clone https://github.com/wbthomason/packer.nvim " install-path))
    (vim.api.nvim_command "packadd packer.nvim")))

; this giant macro removes
; the need to use { 1 name }
; when using `use` with a configuration
(macro use-pkg [name config?]
  (fn merge-tables [a b]
    (fn is-type [v type-name]
      (= (type v) type-name))

    (fn both-have-type [a b type-name]
      (and (is-type a type-name) (is-type b type-name)))
    (var merged {})
    (each [ k v (pairs a) ]
      (tset merged k v))
    (each [ k v (pairs b) ]
      (let [ other-value (. a k) ]
        (tset merged k (if (both-have-type v other-value :table)
                         (merge-tables v other-value)
                         v))))
    merged)
   (assert name "expected a name")
  (if config?
    (let [ final-config (merge-tables { 1 name } config?) ]
      `(use ,final-config))
    `(use ,name)))

(local packer (require :packer))

(packer.startup (fn packer-startup [use]
                  (use-pkg :wbthomason/packer.nvim) ; prevent packer from suiciding

                  ; theming
                  (use-pkg :morhetz/gruvbox)
                  ;(use-pkg :itchyny/lightline.vim)
                  (use-pkg :glepnir/galaxyline.nvim)
                  (use-pkg :akinsho/nvim-bufferline.lua { :requires :kyazdani42/nvim-web-devicons })

                  ; syntax highlight
                  (use-pkg :nvim-treesitter/nvim-treesitter)

                  ; tpope essentials
                  (use-pkg :tpope/vim-repeat)
                  (use-pkg :tpope/vim-surround)
                  (use-pkg :tpope/vim-fugitive) ; git
                  (use-pkg :tpope/vim-unimpaired)

                  ; commentary-like
                  (use-pkg :b3nj5m1n/kommentary)

                  ; moving around
                  (use-pkg :kyazdani42/nvim-tree.lua { :requires :kyazdani42/nvim-web-devicons })
                  (use-pkg :junegunn/fzf { :run vim.fn.fzf#install })
                  (use-pkg :junegunn/fzf.vim)
                  (use-pkg :unblevable/quick-scope)

                  ; lsp
                  (use-pkg :nvim-lua/lsp-status.nvim)
                  (use-pkg :nvim-lua/nvim-lspconfig)
                  (use-pkg :nvim-lua/completion-nvim)


                  nil))

; after startup
(macro setup-config [name]
  `(require ,(.. :plug-config/ name)))

(macro setup-keys [name]
  `(require ,(.. :plug-config/keys/ name)))

(setup-config :theme)
(setup-config :kommentary)
;(setup-config :lightline)
(setup-config :eviline)
(setup-config :nvim-lsp)
(setup-config :nvim-tree)
(setup-config :treesitter)
((. (require :bufferline) :setup))

(setup-keys :fzf)
(setup-keys :lsp)
(setup-keys :nvim-tree)
(setup-keys :vim-fugitive)

nil
