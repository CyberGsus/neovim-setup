(local nvim-lsp (require :lspconfig))
(local completion (require :completion))
(local lsp-status (require :lsp-status))

(fn on-attach [client]
  (doto client
        (completion.on_attach)
        (lsp-status.on_attach)))


(lsp-status.config {
                    :indicator_errors ""
                    :indicator_warnings ""
                    :indicator_info ""
                    :indicator_hint ""
                    :indicator_ok ""
                    :current_function true ; display & update current function
                    })

(lsp-status.register_progress) ; register progress handler

(nvim-lsp.rust_analyzer.setup { :on_attach on-attach :capabilities lsp-status.capabilities })
(nvim-lsp.ccls.setup { :on_attach on-attach :capabilities lsp-status.capabilities })
(nvim-lsp.pyls.setup { :on_attach on-attach :capabilities lsp-status.capabilities })
; (nvim-lsp.lua.setup { :on_attach on-attach :capabilities lsp-status.capabilities })



(fn []
  (if (> (length (vim.lsp.buf_get_clients)) 0)
    (lsp-status.status)
    ""))
