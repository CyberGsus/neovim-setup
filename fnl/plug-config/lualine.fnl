(local lualine (require :lualine))

(lualine.setup {:options {:theme :gruvbox :icons_enabled true}
                :extensions [:fzf :nvim-tree :fugitive]
                :sections {; TODO: figure out how to get char value in hex.
                           :lualine_y []
                           :lualine_c [{1 :filename :status true} :LspStatus]}})

nil