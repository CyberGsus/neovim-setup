local function convert_scope(scope)
  if (scope == "global") then
    return "o"
  elseif (scope == "buffer") then
    return "bo"
  elseif (scope == "window") then
    return "wo"
  else
    return "o"
  end
end
local function is_in_table(tbl, value)
  for _, v in ipairs(tbl) do
    if (v == value) then
      return true
    end
  end
  return false
end
local function map(mode, lhs, rhs, more_options_3f)
  local options = {noremap = true}
  if more_options_3f then
    options = vim.tbl_extend("force", options, more_options_3f)
  end
  return vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
local function options(scope, kvpairs)
  local converted_scope = vim[convert_scope(scope)]
  for k, v in pairs(kvpairs) do
    converted_scope[k] = v
  end
  return nil
end
return {["is-in-table"] = is_in_table, map = map, options = options}