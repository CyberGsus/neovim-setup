local ts = require("nvim-treesitter.configs")
ts.setup({ensure_installed = {"c", "cpp", "haskell", "rust", "fennel"}, highlight = {enable = true}})
return nil
