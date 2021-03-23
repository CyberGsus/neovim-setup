local function map(mode, lhs, rhs, opts_3f)
  local options = {noremap = true}
  if opts_3f then
    options = vim.tbl_extend("force", options, opts_3f)
  end
  return vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
return map
