local tp = require("telescope")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
return tp.setup({defaults = {mappings = {i = {["<esc>"] = actions.close}}}})
