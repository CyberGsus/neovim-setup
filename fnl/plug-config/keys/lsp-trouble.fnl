(local utils (require :utils))
(local mapcmd utils.map-command)

(mapcmd :n :<leader>l :LspTroubleToggle)
(mapcmd :n :<leader>lw :LspTroubleWorkspaceToggle)
(mapcmd :n :<leader>ld :LspTroubleDocumentToggle)
