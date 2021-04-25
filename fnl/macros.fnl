(macro make-command [name]
  (let [name (.. ":" name :<cr>)]
    `name))
