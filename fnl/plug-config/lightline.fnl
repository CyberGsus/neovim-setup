(tset vim.g "lightline" { :colorscheme :gruvbox :active {
                                                         :left [ [ :mode :paste ]
                                                                [ :cocstaus :gitbranch :readonly :filename :modified ] ]
                                                         :right [ [ :lineinfo ]
                                                                  [ :charvaluehex ]
                                                                  [ :fileformat :fileencoding :filetype :diagnostic ] ]
                                                         :component { :filename :%f :modified :%m :charvaluehex :0x%B }
                                                         :component_function { :gitbranch "fugitive#head" }}
                         :separator { :left "" :right "" }
                         :subseparator { :left "" :right "" }})
