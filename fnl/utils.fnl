; instead of 'o', 'bo' and 'wo' I have 'global' 'buffer' and 'window' which increase
; readability
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

(fn is-in-table [tbl value]
  (each [ _ v (ipairs tbl) ]
    (when (= v value)
      (lua "return true")))
  false)

(fn options [scope kvpairs]
  (let [ scope-tbl (. vim (convert-scope scope)) ]
    (each [ k v (pairs kvpairs) ]
      (tset scope-tbl k v))))


; gets a name (string) and
; converts it to a command string,
; e.g 'echo hello' -> ':echo hello<cr>'
(fn make-command [name]
  (.. :: name :<cr>))

(fn map-command [mode lhs rhs more-options?]
  (map mode lhs (make-command rhs more-options?)))

(fn set-global [key value]
  (tset vim.g key value))


(fn set-globals [kvpairs]
  (each [ k v (pairs kvpairs) ]
    (tset vim.g k v)))


; gets a list of prefixes, e.g [ :nvim :tree ] and a table of
; options such as { :a 1 :b 2 } then it returns { :nvim_tree_a 1 :nvim_tree_b 2 }
(fn prefix-options [prefixes kvpairs]
  (var tbl {})
  (local built-prefix (-> prefixes
                           (table.concat :_)
                           (.. :_)))
  (each [ k v (pairs kvpairs) ]
    (tset tbl (.. built-prefix k) v))
  tbl)

; gets environment variables
(fn env []
  (var variables {})
  (each [ k v (pairs (vim.fn.environ)) ]
    (table.insert variables (string.format :%s=%s k v)))
  variables)

(fn merge-tables [a b]
  (fn is-type [v type-name]
    (= (type v) type-name))

  (fn both-have-type [a b type-name]
    (and (is-type a type-name) (is-type b type-name)))
  (var merged {})
  (each [ k v (pairs a) ]
    (tset merged k v))
  (each [ k v (pairs b) ]
    (let [ other-value (. a k) ]
      (tset merged k (if (both-have-type v other-value :table)
        (merge-tables v other-value)
        v))))
  merged)
{

 :is-in-table is-in-table

 :options options

 :map map
 :map-command map-command

 :set-global set-global

 :set-globals set-globals

 :merge-tables merge-tables

 :make-command make-command

 :prefix-options prefix-options
 }
