local nvim_lsp = require("lspconfig")
local completion = require("completion")
nvim_lsp.rust_analyzer.setup({on_attach = completion.on_attach})
nvim_lsp.ccls.setup({on_attach = completion.on_attach})
nvim_lsp.pyls.setup({on_attach = completion.on_attach})
return nil
