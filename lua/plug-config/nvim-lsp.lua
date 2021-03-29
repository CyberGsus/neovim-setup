local nvim_lsp = require("lspconfig")
local completion = require("completion")
local lsp_status = require("lsp-status")
local function on_attach(client)
  local _0_0 = client
  completion.on_attach(_0_0)
  lsp_status.on_attach(_0_0)
  return _0_0
end
lsp_status.config({current_function = true, indicator_errors = "\239\153\152", indicator_hint = "\239\132\168", indicator_info = "\239\129\154", indicator_ok = "\239\128\140", indicator_warnings = "\239\132\170"})
lsp_status.register_progress()
nvim_lsp.rust_analyzer.setup({capabilities = lsp_status.capabilities, on_attach = on_attach})
nvim_lsp.ccls.setup({capabilities = lsp_status.capabilities, on_attach = on_attach})
return nvim_lsp.pyls.setup({capabilities = lsp_status.capabilities, on_attach = on_attach})
