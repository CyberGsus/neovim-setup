let g:lightline = {
      \ 'colorscheme' : 'gruvbox',
      \ 'active' : {
      \ 'left' : [ [ 'mode', 'paste', ],
      \        [ 'cocstatus', 'git', 'readonly', 'filename', 'modified' ]
      \ ],
      \ 'right' : [
      \         [ 'lineinfo' ],
      \         [ 'charvaluehex' ],
      \         [ 'fileformat', 'fileencoding', 'filetype', 'diagnostic' ],
      \ ],
      \},
      \ 'component' : {
      \   'filename' : '%f',
      \   'modified' : '%m',
      \   'charvaluehex' : '0x%B'
      \ },
      \ 'component_function' : {
      \ 'gitbranch' : 'fugitive#head',
      \ }
      \ }
let g:lightline.separator = {
      \   'left': '', 'right': ''
      \}
let g:lightline.subseparator = {
      \   'left': '', 'right': ''
      \}


set laststatus=2
