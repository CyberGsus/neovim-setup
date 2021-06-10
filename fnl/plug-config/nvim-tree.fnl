(local utils (require :utils))
(fn nvim-tree-options [opts]
  (utils.set-globals (utils.prefix-options [:nvim :tree] opts)))

(nvim-tree-options {:side :left
                    :width 30
                    :ignore [:.git :.node_modules :.cache]
                    :auto_close 1
                    ; close when it's the last window
                    :quit_on_open 1
                    ; auto-close when opening a file
                    :follow 1
                    ; update cursor when entering a buffer
                    :indent_markers 1
                    ; show indent markers when folders are open
                    :hide_dotfiles 0
                    ; don't hide files starting with '.'
                    :git_hl 1
                    ; highlight git attributes
                    :width_allow_resize 1
                    ; resize when opening a file
                    :disable_netrw 1
                    ; disable netrw
                    :hijack_netrw 1
                    ; prevent ntrw from automatically opening when opening directory
                    :add_trailing 1
                    ; append trailing slash to folder names
                    :show_icons {:git 1 :folders 0 :files 0}
                    :tree_icons {:default " "
                                 :symlink " "
                                 :git {:unstaged "✗ "
                                       :staged "✓ "
                                       :unmerged " "
                                       :renamed "➜ "
                                       :untracked "★ "}
                                 :folder {:default " "
                                          :open " "
                                          :empty " "
                                          :empty_open " "
                                          :symlink " "
                                          :symlink_open " "}}})

nil
