(tset vim.g "mapleader" ",")


;; post-package-load config
(vim.cmd "colorscheme gruvbox")

(require :options) ; general options

(tset vim.g :python3_host_prog "/usr/bin/python3") ; set python interpreter

(require :plugins)
(require :plug-config) ; per-plugin configuration
(require :keys)        ; load keymaps
