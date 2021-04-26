(local utils (require :utils))

(utils.options :global {:hidden true
                        :encoding :utf-8
                        :ruler true
                        :pumheight 10
                        :cmdheight 2
                        :splitbelow true
                        :t_Co :256
                        :smarttab true
                        :ignorecase true
                        :wildmode "list:longest"
                        :laststatus 2
                        :showtabline 2
                        :showmode false
                        :backup false
                        :writebackup false
                        :updatetime 300
                        :timeoutlen 500
                        :clipboard :unnamedplus
                        :mouse :nicr
                        :hlsearch false
                        :ignorecase true
                        :smartcase true
                        :completeopt "menuone,noinsert,noselect"
                        :termguicolors true})

(utils.options :window {:wrap false
                        :conceallevel 0
                        :cursorline true
                        :number true
                        :relativenumber true
                        :signcolumn :number
                        :list true})

(utils.options :buffer {:tabstop 2
                        :shiftwidth 2
                        :smartindent true
                        :autoindent true
                        :expandtab true})

nil
