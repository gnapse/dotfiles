"
" Configuration options specific to third-party plugins
"

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

map <leader>t :CtrlP<CR>
map <leader>o :CtrlPBuffer<CR>
map <leader>r :CtrlPMRU<CR>
map <leader>m :CtrlPMixed<CR>
