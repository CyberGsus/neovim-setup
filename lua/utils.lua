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
local function map(mode, lhs, rhs, more_options_3f)
  local options = {noremap = true, silent = true}
  if more_options_3f then
    options = vim.tbl_extend("force", options, more_options_3f)
  end
  return vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
local function is_in_table(tbl, value)
  for _, v in ipairs(tbl) do
    if (v == value) then
      return true
    end
  end
  return false
end
local function options(scope, kvpairs)
  local scope_tbl = vim[convert_scope(scope)]
  for k, v in pairs(kvpairs) do
    scope_tbl[k] = v
  end
  return nil
end
local function make_command(name)
  return (":" .. name .. "<cr>")
end
local function map_command(mode, lhs, rhs, more_options_3f)
  return map(mode, lhs, make_command(rhs, more_options_3f))
end
local function set_global(key, value)
  vim.g[key] = value
  return nil
end
local function set_globals(kvpairs)
  for k, v in pairs(kvpairs) do
    vim.g[k] = v
  end
  return nil
end
local function prefix_options(prefixes, kvpairs)
  local tbl = {}
  local built_prefix = (table.concat(prefixes, "_") .. "_")
  for k, v in pairs(kvpairs) do
    tbl[(built_prefix .. k)] = v
  end
  return tbl
end
return {["is-in-table"] = is_in_table, ["make-command"] = make_command, ["map-command"] = map_command, ["prefix-options"] = prefix_options, ["set-global"] = set_global, ["set-globals"] = set_globals, map = map, options = options}
