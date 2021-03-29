(local utils (require :utils))
(utils.set-global :lightline { :colorscheme :gruvbox :active {
                                                        :left [ [ :mode :paste ]
                                                               [ :gitbranch :filename :modified ]
                                                               ]
                                                        :right [ [ :lineinfo ]
                                                                [ :filetype ]
                                                                ]
                                                        :component_function { :gitbranch :gitbranch#name } }
                        :separator { :left "" :right "" }
                        :subseparator { :left "" :right "" }})


nil
