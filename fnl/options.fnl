(local scopes { :global vim.o :buffer vim.bo :window vim.wo })

(fn options [scope kvpairs]
  (each [ k v (pairs kvpairs) ]
    (tset (. scopes scope) k v))
  nil)

(local indent 2)


(options :global {
                  :hidden true
                  :encoding "utf-8"
                  :ruler true
                  :pumheight 10
                  :cmdheight 2
                  :splitbelow true
                  :t_Co "256"
                  :smarttab true
                  :ignorecase true
                  :wildmode "list:longest"
                  :laststatus 2
                  :background "dark"
                  :showtabline 2
                  :showmode false
                  :backup false
                  :writebackup false
                  :updatetime 300
                  :timeoutlen 500
                  :clipboard "unnamedplus"
                  :mouse "nicr"
                  :hlsearch false
                  :ignorecase true
                  :smartcase true
                  :completeopt "menuone,noinsert,noselect"
                  })


(options :window {
                  :wrap false
                  :conceallevel 0
                  :cursorline true
                  :number true
                  :relativenumber true
                  :signcolumn "number"
                  :list true
                  })

(options :buffer {
                  :tabstop indent
                  :shiftwidth indent
                  :smartindent true
                  :autoindent true
                  })
nil
