(local utils (require :utils))

(vim.cmd "colorscheme gruvbox")
(utils.options :global { :background :dark } )
(utils.set-globals (utils.prefix-options [ :gruvbox ] { :contrast_dark :medium
                                                       :italics 1 ; turn on italic
                                                       }))
nil


