local nvim_lsp = require("lspconfig")
local completion = require("completion")
nvim_lsp.rust_analyzer.setup({on_attach = completion.on_attach})
return nvim_lsp.ccls.setup({on_attach = completion.on_attach})
