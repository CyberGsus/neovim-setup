(local nvim-lsp (require :lspconfig))
(local completion (require :completion))
(local lsp-status (require :lsp-status))
(local utils (require :utils))

(fn on-attach [client]
  (doto client
    (completion.on_attach)
    (lsp-status.on_attach))
  nil)

(lsp-status.config {:current_function true
                    ; display & update current function
                    })

(lsp-status.register_progress)

; register progress handler

; for lightline
(vim.cmd "
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval(\"require('lsp-status').status()\")
  endif
return ''
endfunction")

(local default-options
       {:on_attach on-attach :capabilities lsp-status.capabilities})

; don't ask.
(macro setup-lsp [name options?]
  `((. nvim-lsp ,name :setup) (utils.merge-tables default-options
                                                  ,(or options? []))))

(setup-lsp :rust_analyzer)
(setup-lsp :ccls)
(setup-lsp :pyls)
(setup-lsp :metals)
(setup-lsp :hls)
(setup-lsp :gopls)
(setup-lsp :tsserver)

;(nvim-lsp.rust_analyzer.setup default-options)

; rust
; (nvim-lsp.rust_analyzer.setup default-options)
; c/cpp
; (nvim-lsp.ccls.setup default-options)
; python
;(nvim-lsp.pyls.setup default-options)
; scala
;(nvim-lsp.metals.setup default-options)
; haskell needs hls: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#hls
;(nvim-lsp.hls.setup default-options)
;(nvim-lsp.gopls.setup default-opt)
