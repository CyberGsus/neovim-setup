(tset vim.g "mapleader" ",")
;; packages
(vim.cmd "packadd paq-nvim")
(local paq (. (require :paq-nvim) :paq))

(paq { 1 :savq/paq-nvim  :opt true })
(paq { 1 :shougo/deoplete-lsp })
(paq { 1 :shougo/deoplete.nvim :hook (. vim.fn :remote#host#UpdateRemotePlugins) })
(paq { 1 :nvim-treesitter/nvim-treesitter })
(paq { 1 :neovim/nvim-lspconfig })
(paq { 1 :neovim-lua/completion-nvim })
(paq { 1 :neovim-lua/lsp_extensions.nvim })
(paq { 1 :junegunn/fzf :hook (. vim.fn "fzf#install") })
(paq { 1 :junegunn/fzf.vim })
(paq { 1 :ojroques/nvim-lspfuzzy })
(paq { 1 :sheerun/vim-polyglot})
(paq { 1 :jiangmiao/auto-pairs})
(paq { 1 :morhetz/gruvbox })
(paq { 1 :tpope/vim-repeat })
(paq { 1 :tpope/vim-surround })
(paq { 1 :tpope/vim-commentary })
(paq { 1 :itchyny/lightline.vim })
(paq { 1 :ryanoasis/vim-devicons })
(paq { 1 :airblade/vim-rooter })
(paq { 1 :rust-lang/rust.vim })

; telescope
(paq { 1 :nvim-lua/popup.nvim })
(paq { 1 :nvim-lua/plenary.nvim })
(paq { 1 :nvim-telescope/telescope.nvim })
; (paq { 1 "kyazdani42/nvim-web-devicons" })
; (paq { 1 "kyazdani42/nvim-tree.lua" })
;; (paq { 1 :neoclide/coc.nvim :branch :release }) ; waiting for autocmd for configuring this

;; post-package-load config
(vim.cmd "colorscheme gruvbox")

;; options

(local scopes { :o vim.o :b vim.bo :w vim.wo })
(fn opt [scope key value]
  (tset (. scopes scope) key value)
  (if (not= scope :o)
    (tset scopes.o key value)))

(local indent 2)

(opt :b :expandtab true)
(opt :b :shiftwidth indent)
(opt :b :smartindent true)
(opt :b :tabstop indent)
(opt :o :hidden true)
(opt :o :ignorecase true)
(opt :o :joinspaces false)
(opt :o :scrolloff 4)
(opt :o :shiftround true)
(opt :o :sidescrolloff 8)
(opt :o :smartcase true)
(opt :o :splitbelow true)
(opt :o :splitright true)
(opt :o :termguicolors true)
(opt :o :wildmode "list:longest")
(opt :w :list true) ; show invisible characters
(opt :w :number true)
(opt :w :relativenumber true)
(opt :w :wrap false) ;; set nowrap
(opt :o :completeopt "menuone,noinsert,noselect") ;; deoplete options
(opt :o :showmode false)

;; keymaps
(fn map [mode lhs rhs opts?]
  (var options { :noremap true })
  (if opts?
    (set options (vim.tbl_extend "force" options opts)))
  (vim.api.nvim_set_keymap mode lhs rhs options))

(map "" :<leader>c "\"+y") ;; copy to clipboard in normal, visual, select and operator modes
(map :i :<c-u> "<c-g>u<c-u>") ;; Make <c-u>
(map :i :<c-w> "<c-g>u<c-w>")
(map :n :<c-l> :<cmd>noh<cr>) ;; clear highlights

(map :i :jk :<esc>) ;; classic
(map :i :<esc> :<nop>)



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

;;; configuring treesitter
(local ts (require :nvim-treesitter.configs))
(ts.setup { :ensure_installed "maintained" :highlight { :enable true } })

;; configure lsp client
(local lsp (require :lspconfig))
(local lspfuzzy (require :lspfuzzy))

(lsp.ccls.setup {})
; (lsp.pyls.setup { :root_dir (lsp.util.root_patern ".git" (vim.fn.getcwd)) }) ;; err: property 'root_pattern' not found
(lspfuzzy.setup {})

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

(tp.setup { :defaults { :mappings { :i { "<esc>" actions.close } } } })

;; Find files using Telescope command-line sugar.
(map :n "<leader>ff" "<cmd>Telescope find_files<cr>")
(map :n "<leader>fg" "<cmd>Telescope live_grep<cr>")
(map :n "<leader>fb" "<cmd>Telescope buffers<cr>")
(map :n "<leader>fh" "<cmd>Telescope help_tags<cr>")


nil
