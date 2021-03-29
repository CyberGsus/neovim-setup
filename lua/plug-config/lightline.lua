vim.g["lightline"] = {active = {component_function = {gitbranch = "gitbranch#name"}, left = {{"mode", "paste"}, {"gitbranch", "filename", "modified"}}, right = {{"lineinfo"}, {"filetype"}}}, colorscheme = "gruvbox", separator = {left = "\238\130\176", right = "\238\130\178"}, subseparator = {left = "\238\130\177", right = "\238\130\179"}}
return nil
