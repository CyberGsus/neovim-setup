; install & load packer if not present
(let [data-path (vim.fn.stdpath :data)
      install-path (.. data-path :/site/pack/packer/start/packer.nvim)
      expanded-path (vim.fn.glob install-path)]
  (when (not= (vim.fn.empty expanded-path) 0)
    (print "installing packer...")
    (vim.api.nvim_command (.. "!git clone https://github.com/wbthomason/packer.nvim "
                              install-path))
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
    (each [k v (pairs a)]
      (tset merged k v))
    (each [k v (pairs b)]
      (let [other-value (. a k)]
        (tset merged k (if (both-have-type v other-value :table)
                           (merge-tables v other-value)
                           v))))
    merged)

  (assert name "expected a name")
  (if config?
      (let [final-config (merge-tables {1 name} config?)]
        `(use ,final-config))
      `(use ,name)))

(macro get-config [name]
  `(require ,(.. :plug-config/ name)))

(macro get-keys [name]
  `(require ,(.. :plug-config/keys/ name)))

(local packer (require :packer))

(packer.startup (fn packer-startup [use]
                  (use-pkg :wbthomason/packer.nvim)
                  (use-pkg :arcticicestudio/nord-vim)
                  (use-pkg :phaazon/hop.nvim)
                  (use-pkg :ThePrimeagen/harpoon
                           {:requires [:nvim-lua/plenary.nvim
                                       :nvim-lua/popup.nvim]})
                  (use-pkg :hoob3rt/lualine.nvim
                           {:requires :kyazdani42/nvim-web-devicons})
                  (use-pkg :nvim-treesitter/nvim-treesitter
                           {:requires :christianchiarulli/nvcode-color-schemes.vim})
                  ; tools
                  (use-pkg :jiangmiao/auto-pairs)
                  (use-pkg :tpope/vim-repeat)
                  (use-pkg :tpope/vim-surround)
                  (use-pkg :tpope/vim-fugitive)
                  (use-pkg :b3nj5m1n/kommentary)
                  (use-pkg :kyazdani42/nvim-tree.lua
                           {:requires :kyazdani42/nvim-web-devicons})
                  (use-pkg :junegunn/fzf {:run vim.fn.fzf#install})
                  (use-pkg :junegunn/fzf.vim)
                  (use-pkg :unblevable/quick-scope)
                  (use-pkg :nvim-lua/lsp-status.nvim)
                  (use-pkg :neovim/nvim-lspconfig)
                  (use-pkg :nvim-lua/completion-nvim)
                  (use-pkg :folke/lsp-trouble.nvim
                           {:requires :kyazdani42/nvim-web-devicons})
                  (use-pkg :folke/lsp-colors.nvim) ; fix sw and ts
                  nil))

(get-config :kommentary)
;(get-config :eviline)
(get-config :lualine)
(get-config :nvim-lsp)
(get-config :nvim-tree)
(get-config :treesitter)
(get-config :hop)
(get-config :harpoon)

(get-keys :fzf)
(get-keys :lsp)
(get-keys :nvim-tree)
(get-keys :vim-fugitive)
(get-keys :lsp-trouble)
(get-keys :hop)
(get-keys :harpoon)

(get-config :theme)

nil
