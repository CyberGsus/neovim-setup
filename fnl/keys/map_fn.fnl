(fn map [mode lhs rhs opts?]
  (var options { :noremap true })
  (if opts?
    (set options (vim.tbl_extend "force" options opts?)))
  (vim.api.nvim_set_keymap mode lhs rhs options))


map
