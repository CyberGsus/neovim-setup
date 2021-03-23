(local map (require :keys/map_fn))
;; Find files using Telescope command-line sugar.
(map :n "<leader>ff" "<cmd>Telescope find_files<cr>")
(map :n "<leader>fg" "<cmd>Telescope live_grep<cr>")
(map :n "<leader>fb" "<cmd>Telescope buffers<cr>")
(map :n "<leader>fh" "<cmd>Telescope help_tags<cr>")
