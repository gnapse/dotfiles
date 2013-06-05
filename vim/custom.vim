" Always show line numbers
set number

" Color scheme
set background=dark
colorscheme vividchalk

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

" Enable persistent undo
set undofile
set undodir=~/.vim/tmp/undo
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab
  set stal=2
catch
endtry

" Delete trailing white space on save for certain types of files
autocmd BufWrite *.py :FixWhitespace
autocmd BufWrite *.rb :FixWhitespace
autocmd BufWrite *.js :FixWhitespace
autocmd BufWrite *.css :FixWhitespace
autocmd BufWrite *.coffee :FixWhitespace

" git commands shortcuts
map <leader>gst :Gstatus<cr>

" Show/Hide invisibles with <leader>i
set listchars=tab:▸\ ,eol:¬
nmap <leader>i :set list!<CR>

" Add new-line when pressing ENTER in normal mode
map <CR> o<Esc>
