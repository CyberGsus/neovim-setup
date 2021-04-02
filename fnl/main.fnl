(tset vim.g "mapleader" ",")
(require :options) ; general options

(tset vim.g :python3_host_prog "/usr/bin/python3") ; set python interpreter

(require :keys)
(require :plugins)
(require :plug-config) ; per-plugin configuration

(local utils (require :utils))

;; post-package-load config
; theming
(vim.api.nvim_command "colorscheme gruvbox")
(utils.options :global { :background :dark })
(utils.set-globals (utils.prefix-options [ :gruvbox ] {
                                                   :contrast_dark :medium
                                                   :italic 1
                                                   }))
nil
