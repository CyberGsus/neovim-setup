vim.g["lightline"] = {active = {component = {filename = "%f", modified = "%m"}, component_function = {gitbranch = "gitbranch#name"}, left = {{"mode", "paste"}, {"gitbranch", "readonly", "filename", "modified"}}, right = {{"lineinfo"}}}, colorscheme = "gruvbox", separator = {left = "\238\130\176", right = "\238\130\178"}, subseparator = {left = "\238\130\177", right = "\238\130\179"}}
return nil
