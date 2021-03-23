(local nvim-lsp (require :lspconfig))
(local completion (require :completion))

(nvim-lsp.rust_analyzer.setup { :on_attach completion.on_attach })
(nvim-lsp.ccls.setup { :on_attach completion.on_attach })
