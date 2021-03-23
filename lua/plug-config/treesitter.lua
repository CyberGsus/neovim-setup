local ts = require("nvim-treesitter.configs")
return ts.setup({ensure_installed = "maintained", highlight = {enable = true}})
