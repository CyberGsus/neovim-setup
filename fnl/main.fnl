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
(local nvim-lsp (require :lspconfig))
(local completion (require :completion))

; plug-config/nvim-lsp
(nvim-lsp.rust_analyzer.setup { :on_attach completion.on_attach })
(nvim-lsp.ccls.setup { :on_attach completion.on_attach })
; (lsp.pyls.setup { :root_dir (lsp.util.root_patern ".git" (vim.fn.getcwd)) }) ;; err: property 'root_pattern' not found

;; plug-config/lightline.vim
(tset vim.g "lightline" { :colorscheme :gruvbox :active {
                                                         :left [ [ :mode :paste ]
                                                                [ :cocstaus :gitbranch :readonly :filename :modified ] ]
                                                         :right [ [ :lineinfo ]
                                                                  [ :charvaluehex ]
                                                                  [ :fileformat :fileencoding :filetype :diagnostic ] ]
                                                         :component { :filename :%f :modified :%m :charvaluehex :0x%B }
                                                         :component_function { :gitbranch "fugitive#head" }}
                         :separator { :left "" :right "" }
                         :subseparator { :left "" :right "" }})


; keys/lsp.lua

(map :n "<space>," "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
(map :n "<space>;" "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
(map :n "<space>a" "<cmd>lua vim.lsp.buf.code_action()<CR>")
(map :n "<space>d" "<cmd>lua vim.lsp.buf.definition()<CR>")
(map :n "<space>f" "<cmd>lua vim.lsp.buf.formatting()<CR>")
(map :n "<space>h" "<cmd>lua vim.lsp.buf.hover()<CR>")
(map :n "<space>m" "<cmd>lua vim.lsp.buf.rename()<CR>")
(map :n "<space>r" "<cmd>lua vim.lsp.buf.references()<CR>")
(map :n "<space>s" "<cmd>lua vim.lsp.buf.document_symbol()<CR>")

;; plug-config/telescope
(local tp (require :telescope))
(local actions (require :telescope.actions))
(local previewers (require :telescope.previewers))

(tp.setup { :defaults { :mappings { :i { "<esc>" actions.close } }}})

; keys/telescope.lua
;; Find files using Telescope command-line sugar.
(map :n "<leader>ff" "<cmd>Telescope find_files<cr>")
(map :n "<leader>fg" "<cmd>Telescope live_grep<cr>")
(map :n "<leader>fb" "<cmd>Telescope buffers<cr>")
(map :n "<leader>fh" "<cmd>Telescope help_tags<cr>")

; keys/nvim-tree.lua

(fn nvim-tree-options [options]
  (each [name opt (pairs options)]
    (tset vim.g (.. :nvim_tree_ name) opt)))


(nvim-tree-options {
                     :side "left"
                     :width 30
                     :ignore       [ :.git :.node_modules :.cache ]
                     :auto_open 1          ; open the tree when typing nvim <dir> or nvim
                     :auto_close 1         ; close when it's the last window
                     :quit_on_open 1         ; auto-close when opening a file
                     :follow 1             ; update cursor when entering a buffer
                     :indent_markers 1     ; show indent markers when folders are open
                     :hide_dotfiles 0      ; don't hide files starting with '.'
                     :git_hl 1             ; highlight git attributes
                     :width_allow_resize 1 ; resize when opening a file
                     :disable_netrw 1      ; disable netrw
                     :hijack_netrw 1       ; prevent ntrw from automatically opening when opening directory
                     :add_trailing 1       ; append trailing slash to folder names
                     :show_icons {
                                  :git 1
                                  :folders 0
                                  :files 0
                                  }
                     :tree_icons {
                                  :default " "
                                  :symlink " "
                                  :git {
                                        :unstaged "✗ "
                                        :staged "✓ "
                                        :unmerged " "
                                        :renamed "➜ "
                                        :untracked "★ "
                                        }
                                  :folder {
                                           :default " "
                                           :open " "
                                           :empty " "
                                           :empty_open " "
                                           :symlink " "
                                           :symlink_open " "
                                           }
                                  }
                     })

; keys/nvim-tree.lua
(map :n :<c-n> ::NvimTreeToggle<cr>)
(map :n :<leader>r ::NvimTreeRefresh<cr>)

nil
