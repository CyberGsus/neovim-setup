local nvim_lsp = require("lspconfig")
local completion = require("completion")
local lsp_status = require("lsp-status")
local function on_attach(client)
  local _0_0 = client
  completion.on_attach(_0_0)
  lsp_status.on_attach(_0_0)
  return _0_0
end
lsp_status.config({current_function = true})
lsp_status.register_progress()
vim.cmd("\nfunction! LspStatus() abort\n  if luaeval('#vim.lsp.buf_get_clients() > 0')\n    return luaeval(\"require('lsp-status').status()\")\n  endif\nreturn ''\nendfunction")
local default_options = {capabilities = lsp_status.capabilities, on_attach = on_attach}
nvim_lsp.rust_analyzer.setup(default_options)
nvim_lsp.pyls.setup(default_options)
nvim_lsp.metals.setup(default_options)
return nvim_lsp.hls.setup(default_options)
