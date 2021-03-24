(local map (require :keys/map_fn))


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

; always force write on opened files
; don't do this! it behaves like :abbr on command buffer. (map :c :w :w! { :noremap false })
; TODO: need to force write files when opening them, have to see why!

nil