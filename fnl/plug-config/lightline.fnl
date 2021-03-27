(tset vim.g :lightline { :colorscheme :gruvbox :active {
                                                        :left [ [ :mode :paste ]
                                                               [ :gitbranch :readonly :filename :modified ]
                                                               ]
                                                        :right [ [ :lineinfo ]
                                                                ]
                                                        :component { :filename "%f" :modified "%m"   }
                                                        :component_function { :gitbranch "gitbranch#name" } }
                        :separator { :left "" :right "" }
                        :subseparator { :left "" :right "" }})


nil
