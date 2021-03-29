(fn convert-scope [scope]
  (if (= scope :global)
    :o
    (= scope :buffer)
    :bo
    (= scope :window)
    :wo
    :o))


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

 :map (fn map [mode lhs rhs more-options?]
        (var options { :noremap true })
        (if more-options?
          (set options (vim.tbl_extend :force options more-options?)))
        (vim.api.nvim_set_keymap mode lhs rhs options))

 :set-global (fn set-global [key value]
               (tset vim.g key value))

 :set-globals (fn set-globals [kvpairs]
                (each [ k v (pairs kvpairs) ]
                  (tset vim.g k v)))

 :prefix-options (fn prefix-options [prefix kvpairs]
                   (var tbl {})
                   (each [ k v (pairs kvpairs) ]
                     (tset tbl (.. prefix "_" k) v))
                   tbl)

 }
