" Always show line numbers
set number

" Color scheme
set background=dark
colorscheme peaksea

" Set font according to system
if has("mac") || has("macunix")
    set gfn=Inconsolata:h16
elseif has("win16") || has("win32")
    set gfn=Bitstream\ Vera\ Sans\ Mono:h11
elseif has("linux")
    set gfn=Monospace\ 11
endif

" Open MacVim in fullscreen mode
if has("gui_macvim")
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions+=e
    set guitablabel=%M\ %t
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim/tmp/undo
    set undofile
catch
endtry

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Delete trailing white space on save for certain types of files
autocmd BufWrite *.rb :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.css :call DeleteTrailingWS()

" git commands shortcuts
map <leader>gst :Gstatus<cr>

" Show/Hide invisibles with <leader>i
set listchars=tab:▸\ ,eol:¬
nmap <leader>i :set list!<CR>

" Add new-line when pressing ENTER in normal mode
map <CR> o<Esc>
