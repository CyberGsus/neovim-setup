(local utils (require :utils))

(local options {:italic 1})

(macro colorscheme [name]
  `(vim.api.nvim_command ,(.. "colorscheme " name)))

(->> options
     (utils.prefix-options [:nord])
     (utils.set-globals))

(colorscheme :nord)

nil
