(fn convert-scope [scope]
  (if (= scope :global)
    :o
    (= scope :buffer)
    :bo
    (= scope :window)
    :wo
    :o))

(fn map [mode lhs rhs more-options?]
        (var options { :noremap true :silent true })
        (if more-options?
          (set options (vim.tbl_extend :force options more-options?)))
        (vim.api.nvim_set_keymap mode lhs rhs options))



{

 :is-in-table (fn is-in-table [tbl value]
                (each [ _ v (ipairs tbl) ]
                  (when (= v value)
                    (lua "return true")))
                false)

 :options (fn options [scope kvpairs]
            (let [ converted-scope (. vim (convert-scope scope)) ]
              (each [ k v (pairs kvpairs) ]
                (tset converted-scope k v))))

 :map map
 :map-command (fn map-command [mode lhs rhs more-options?]
                (map mode lhs (make-command rhs) more-options?))
 :set-global (fn set-global [key value]
               (tset vim.g key value))


 :set-globals (fn set-globals [kvpairs]
                (each [ k v (pairs kvpairs) ]
                  (tset vim.g k v)))

 :make-command (fn make-command [name]
                 (.. ":" name "<cr>"))

 :prefix-options (fn prefix-options [prefix kvpairs]
                   (var tbl {})
                   (each [ k v (pairs kvpairs) ]
                     (tset tbl (.. prefix "_" k) v))
                   tbl)

 }
