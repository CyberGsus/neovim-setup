(local utils (require :utils))

(vim.cmd "
function! GitHead()
return ' ' . FugitiveHead()
endfunction")

(utils.set-global :lightline { :colorscheme :gruvbox
                              :active {
                                       :left [ [ :mode :paste ]
                                              [ :gitbranch :filename :modified :lsp ]
                                              ]
                                       :right [ [ :lineinfo ]
                                               [ :filetype ]
                                               ]
                                       }
                              :component_function { :gitbranch :GitHead
                                                   :lsp :LspStatus }
                              :separator { :left "" :right "" }
                              :subseparator { :left "" :right "" }})


nil
