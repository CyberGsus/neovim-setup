(tset vim.g "lightline" { :colorscheme :gruvbox :active {
                                                         :left [ [ :mode :paste ]
                                                                [:gitbranch :readonly :filename :modified ]
                                                                [ :lsp_warnings :lsp_errors :lsp_ok  ] ]
                                                         :right [ [ :lineinfo ]
                                                                  [ :charvaluehex ]
                                                                  [ :fileformat :fileencoding :filetype ] ]
                                                         :component { :filename "%f" :modified "%m" :charvaluehex "0x%B"   }
                                                         :component_function { :gitbranch "gitbranch#name" } }
                         :separator { :left "" :right "" }
                         :subseparator { :left "" :right "" }})


nil
