(fn map [mode lhs rhs opts?]
  (var options { :noremap true })
  (if opts?
    (set options (vim.tbl_extend "force" options opts?)))
  (vim.api.nvim_set_keymap mode lhs rhs options))


; better nav for omnicomplete
(map :i :<c-j> "\\<c-n>" { :expr true })
(map :i :<c-j> "\\<c-p>" { :expr true })

; use alt + hjkl to resize windows
(map :n :<m-j> ":resize -2<cr>")
(map :n :<m-k> ":resize +2<cr>")
(map :n :<m-h> ":vertial resize -2<cr>")
(map :n :<m-l> ":vertial resize +2<cr>")


(map :i :jk :<esc>)

; tab completion
(map :i :<tab> "pumvisible() ? \"\\<c-n>\" : \"\\<tab>\"" { :expr true })


; better tabbing
(map :v :< :<gv)
(map :v :> :>gv)


; better window navigation
(map :n :<c-h> :<c-w>h)
(map :n :<c-j> :<c-w>j)
(map :n :<c-k> :<c-w>k)
(map :n :<c-l> :<c-w>l)

; buffer navigation

; (map :<s-left> ":bprev<cr>" { :silent true })
; (map :<s-right> ":bnext<cr>" { :silent true })

map
