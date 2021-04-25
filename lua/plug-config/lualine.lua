local lualine = require("lualine")
lualine.setup({extensions = {"fzf", "nvim-tree", "fugitive"}, options = {icons_enabled = true, theme = "gruvbox"}, sections = {lualine_c = {{"filename", status = true}, "LspStatus"}, lualine_y = {}}})
return nil
