(tset vim.g "mapleader" ",")

(require :plugins)

;; post-package-load config
(vim.cmd "colorscheme gruvbox")


(local option (require :options))

(tset vim.g :python3_host_prog "/usr/bin/python3") ; set python interpreter


;; keymaps
(local map (require :mappings))


;;; configuring treesitter
(local ts (require :nvim-treesitter.configs))
(ts.setup { :ensure_installed "maintained" :highlight { :enable true } })

;; configure lsp client
(local lsp (require :lspconfig))
(local lspfuzzy (require :lspfuzzy))

(lsp.ccls.setup {})
; (lsp.pyls.setup { :root_dir (lsp.util.root_patern ".git" (vim.fn.getcwd)) }) ;; err: property 'root_pattern' not found
(lspfuzzy.setup {})

;; themes/lightline.vim
(tset vim.g "lightline" { :colorscheme :gruvbox :active {
                                                         :left [ [ :mode :paste ]
                                                                [ :cocstaus :git :readonly :filename :modified ] ]
                                                         :right [ [ :lineinfo ]
                                                                  [ :charvaluehex ]
                                                                  [ :fileformat :fileencoding :filetype :diagnostic ] ]
                                                         :component { :filename :%f :modified :%m :charvaluehex :0x%B }
                                                         :component_function { :gitbranch "fugitive#head" }}
                         :separator { :left "" :right "" }
                         :subseparator { :left "" :right "" }})

(map :n "<space>," "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
(map :n "<space>;" "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
(map :n "<space>a" "<cmd>lua vim.lsp.buf.code_action()<CR>")
(map :n "<space>d" "<cmd>lua vim.lsp.buf.definition()<CR>")
(map :n "<space>f" "<cmd>lua vim.lsp.buf.formatting()<CR>")
(map :n "<space>h" "<cmd>lua vim.lsp.buf.hover()<CR>")
(map :n "<space>m" "<cmd>lua vim.lsp.buf.rename()<CR>")
(map :n "<space>r" "<cmd>lua vim.lsp.buf.references()<CR>")
(map :n "<space>s" "<cmd>lua vim.lsp.buf.document_symbol()<CR>")

;; plug-config/fzf
(tset vim.g "fzf_action" { :ctrl-t "tab split"
                           :ctrl-x "split"
                           :ctrl-v  "vsplit" })

(tset vim.g "fzf_history_dir" "~/.local/share/fzf-history")

(map "" "<leader>f" ":Files<cr>")
(map "" "<leader>b" ":Buffers<cr>")
(map :n :<leader>g ::Rg<cr>)
(map :n :<leader>t ::Tags<cr>)
(map :n :<leader>m ::Marks<cr>)

;; plug-config/telescope
(local tp (require :telescope))
(local actions (require :telescope.actions))
(local previewers (require :telescope.previewers))

(tp.setup { :defaults { :mappings { :i { "<esc>" actions.close } }}})

;; Find files using Telescope command-line sugar.
(map :n "<leader>ff" "<cmd>Telescope find_files<cr>")
(map :n "<leader>fg" "<cmd>Telescope live_grep<cr>")
(map :n "<leader>fb" "<cmd>Telescope buffers<cr>")
(map :n "<leader>fh" "<cmd>Telescope help_tags<cr>")

(vim.cmd "cmap :w :w!")


nil
