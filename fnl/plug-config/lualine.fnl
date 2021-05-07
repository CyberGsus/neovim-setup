(local lualine (require :lualine))

(lualine.setup {:options {:theme :nord :icons_enabled true}
                :extensions [:fzf :nvim-tree :fugitive]
                :sections {; TODO: figure out how to get char value in hex.
                           :lualine_y []
                           :lualine_c [{1 :filename :status true}]
                           :lualine_x [:LspStatus :filetype]}})

nil
