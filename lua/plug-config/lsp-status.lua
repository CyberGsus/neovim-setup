local my_config = {}
local my_errors = nil
local my_warnings = nil
local my_hints = nil
local my_info = nil
local icons = {}
local diagnostics = require("lsp-status/diagnostics")
local messages = (require("lsp-status/messaging")).messages
local function statusline_component(diagnostics_key)
  local function _0_(bufh)
    local bufh0 = (bufh or vim.api.get_current_buf())
    local icon = (icons[diagnostics_key] .. config.indicator_separator)
    return ((icon or "") .. (diagnostics(bufh0))[diagnostics_key])
  end
  return _0_
end
local function init(_, other_config)
  my_config = vim.tbl_extend("force", my_config, other_config)
  icons = {errors = my_config.indicator_errors, hints = my_config.indicator_hint, info = my_config.indicator_info, warnings = my_config.indicator_warnings}
  my_errors = statusline_component("errors")
  my_warnings = statusline_component("warnings")
  my_hints = statusline_component("hints")
  my_info = statusline_component("info")
  return nil
end
local function process_status(diagnostics0)
  local function process_diagnostic(diagnostics1, cb, name)
    local value = (diagnostics1)[name]
    if (value and (value > 0)) then
      cb(name)
      return nil
    end
  end
  local tbl = {}
  local only_hint = true
  local has_diagnostics = false
  local function cb(name)
    table.insert(tbl, (config[("indicator_" .. name)] .. (diagnostics0)[name]))
    has_diagnostics = true
    if (name ~= "hints") then
      only_hint = false
      return nil
    end
  end
  local process = nil
  local function _0_(...)
    return process_diagnostic(diagnostics0, cb, ...)
  end
  process = _0_
  process("errors")
  process("warnings")
  process("info")
  process("hints")
  return {["has-diagnostics"] = has_diagnostics, ["only-hint"] = only_hint, ["status-parts"] = table.concat(tbl, " ")}
end
local function process_messages()
  local function process_message(msg)
    local function add_if_present(current_value, tbl, prop, cb)
      if not tbl[prop] then
        return current_value
      else
        return cb(current_value, tbl[prop])
      end
    end
    local function between_paren(cv, value)
      return (cv .. "(" .. value .. ")")
    end
    local function progress(msg0)
      local function space_before(cv)
        return (cv .. " ")
      end
      local function spinner(cv, value)
        local frame = my_config.spinner_frames[((msg0.spinner % #my_config.spinner_frames) + 1)]
        return (frame .. " " .. cv)
      end
      local function _0_(_241, _242)
        return (space_before(_241) .. _242)()
      end
      local function _1_(_241, _242)
        return between_paren(space_before(_241), _242)()
      end
      local function _2_(_241, _242)
        return spinner(space_before(_241), _242)()
      end
      return add_if_present(add_if_present(add_if_present("", msg0, "message", _0_), msg0, "percentage", _1_), msg0, "spinner", _2_)
    end
    local function status(msg0)
      local function get_uri(value)
        local filename = vim.uri_to_fname(value)
        filename = vim.fn.fnamemodify(filename, ":~:.")
        local space = math.min(60, math.floor((0.6 * vim.fn.winwidth(0))))
        if (#filename > space) then
          return vim.fn.pathshorten(filename)
        else
          return filename
        end
      end
      local function uri(cv, value)
        return ("(" .. get_uri(value) .. ")" .. cv)
      end
      return add_if_present("", msg0, "uri", uri)
    end
    if msg.progress then
      return progress(msg)
    elseif msg.status then
      return status(msg)
    else
      return msg.content
    end
  end
  local msgs = {}
  for _, msg in ipairs(messages()) do
    local client_name = ("[" .. msg.name .. "]")
    local contents = process_message(msg)
    table.insert(msgs, (client_name .. " " .. contents))
  end
  return table.concat(msgs, " ")
end
local function statusline(bufnr)
  local buf_number = (bufnr or 0)
  if (#vim.lsp.buf_get_clienets(buf_number) == 0) then
    return ""
  else
    local status_info = process_status(diagnostics(buf_number))
    local msg_info = process_messages()
    local base_status = vim.trim((status_info["status-parts"] .. msg_info))
    local symbol = nil
    local function _0_()
      if (my_config.current_function and (vim.b.lsp_current_function and (vim.b.lsp_current_function ~= ""))) then
        return ("(" .. vim.b.lsp_current_function .. ") ")
      else
        return ""
      end
    end
    symbol = (my_config.status_symbol .. (((status_info["has-diagnostics"] and status_info["ony-hint"]) and "") or " ") .. _0_())
    if (base_status ~= "") then
      return (symbol .. base_status .. " ")
    else
      return (symbol .. my_config.indicator_ok .. " ")
    end
  end
end
local function get_component_function()
  return {errors = my_errors, hints = my_hints, info = my_info, warnings = my_warnings}
end
return {_get_component_functions = get_component_function, _init = init, status = statusline}
