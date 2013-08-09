"
" Personal preference .vimrc file
" Largely inspired by http://github.com/nvie/vimrc
"
" To start vim without using this .vimrc file, use:
"     vim -u NORC
"
" To start vim without loading any .vimrc or plugins, use:
"     vim -u NONE
"

" Basic settings {{{

" Use vim settings, rather then vi settings (much better!)
" This must be first, because it changes other options as a side effect.
set nocompatible

" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
filetype off                    " force reloading *after* pathogen loaded
call pathogen#infect('bundle/{}', '~/.vim.local/bundle/{}')
call pathogen#helptags()
filetype plugin indent on       " enable detection, plugins and indenting in one step

" switch colors and syntax highlighting on, if supported
if &t_Co > 2 || has("gui_running")
    syntax on
    set bg=dark
    colorscheme molokai
endif

" Set gui font
if has("gui_running")
    set guifont=Inconsolata-dz\ for\ Powerline:h14 linespace=0
endif

" }}}

" Options {{{

set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set expandtab                   " expand tabs by default (overloadable per file type later)
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set virtualedit=all             " allow the cursor to go in to "invalid" places
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set gdefault                    " search/replace "globally" (on a line) by default
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·,eol:¬

set splitright
set splitbelow

set nolist                      " don't show invisible characters by default,
                                " but it is enabled for some file types (see later)
set pastetoggle=<F2>            " when in insert mode, press <F2> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
set mouse=a                     " enable using the mouse if terminal emulator
                                "    supports it (xterm does)
set fileformats=unix,dos,mac    " Use Unix as the standard file type
set nrformats=                  " make <C-a> and <C-x> play well with
                                "    zero-padded numbers (i.e. don't consider
                                "    them octal or hex)

set hidden                      " hide buffers instead of closing them this
                                "    means that the current buffer can be put
                                "    to background without being written; and
                                "    that marks and undo history are preserved
set switchbuf=useopen           " reveal already opened files from the quick fix
                                "    window instead of opening new buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo

set undofile                    " keep a persistent backup file
set undodir=~/.tmp/vim/undo
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif

set nobackup                    " do not keep backup files, it's 70's style cluttering
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set directory=~/.tmp/vim
                                " store swap files in one of these directories
                                "    (in case swapfile is ever turned on)
set viminfo='20,\"80            " read/write a .viminfo file, don't store more
                                "    than 80 lines of registers
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:longest       " show a list when pressing tab and complete
                                "    till longest common string
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
                                "    this also shows visual selection info
set nomodeline                  " disable mode lines (security measure)
"set ttyfast                     " always use a fast terminal

set cursorline                  " underline the current line, for quick orientation
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorline

set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " don't update the display while executing macros
set laststatus=2                " tell VIM to always put a status line in, even
                                "    if there is only one window
set cmdheight=2                 " use a status bar that is 2 rows high

" set extra vi-compatible options
set cpoptions+=$     " when changing a line, don't redisplay, but put a '$' at
                     " the end during the change
set formatoptions-=o " don't start new lines w/ comment leader on pressing 'o'
au filetype vim set formatoptions-=o
                     " somehow, during vim filetype detection, this gets set
                     " for vim files, so explicitly unset it again

" }}}

" Key-bindings {{{

" Space-bar's default use is redundant, so use <space> as <leader>
let mapleader=" "

" Avoid accidental hits of <F1> while aiming for <Esc>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Fast saving
nmap <leader>w :w!<cr>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Use Q for formatting the current paragraph (or visual selection)
vnoremap Q gq
nnoremap Q gqip

" make p in Visual mode replace the selected text with the yank register
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" Use the damn hjkl keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" Quickly get out of insert mode without your fingers having
" to leave the home row (either use 'jj' or 'jk')
inoremap jj <Esc>

" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Complete whole filenames/lines with a quicker shortcut key in insert mode
inoremap <C-f> <C-x><C-f>
inoremap <C-l> <C-x><C-l>

" Scroll up and down with Shift+k and Shift+j respectively
nmap J <C-d>
nmap K <C-u>

" Quick yanking to the end of the line
nmap Y y$

" Use shift-H and shift-L for move to beginning/end
nnoremap H 0
nnoremap L $

" Use <leader> in front of a delete command both in normal and visual modes
" to delete without adding to yanked stack.
" For example <leader>dd, <leader>dj, 20<leader>dd, etc.
nnoremap <silent> <leader>d "_d
vnoremap <silent> <leader>d "_d

" Yank/paste to the OS clipboard with <leader>y and <leader>p
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Turn off highlighting search results
nnoremap <leader><cr> :noh<cr>

" Edit the vimrc file
nnoremap <silent> <leader>ve :e $MYVIMRC<CR>
nnoremap <silent> <leader>vs :so $MYVIMRC<CR>

" Reselect text that was just pasted
nnoremap <leader>vv V`]

" Toggle show/hide invisible chars
nnoremap <leader><leader>i :set list!<cr>

" Quickly switch to the alternate buffer
nnoremap <leader>a <c-^>

" Increment and decrement numbers
" (Specially because <C-a> is commonly used as Tmux bind-key)
nmap <leader>2 <C-a>
nmap <leader>1 <C-x>

" Creating underline/overline headings for markup languages
" Inspired by http://sphinx.pocoo.org/rest.html#sections
nnoremap <leader>s1 yyPVr=jyypVr=
nnoremap <leader>s2 yyPVr*jyypVr*
nnoremap <leader>s3 yypVr=
nnoremap <leader>s4 yypVr-
nnoremap <leader>s5 yypVr^
nnoremap <leader>s6 yypVr"

" Split previously opened file ('#') in a split window
nnoremap <leader>sh :execute "leftabove vsplit" bufname('#')<cr>
nnoremap <leader>sv :execute "rightbelow vsplit" bufname('#')<cr>

" Toggle spelling
map <leader>ss :setlocal spell!<cr>

" Pull word under cursor into LHS of a substitute (for quick search and replace)
noremap <leader>sw :%s#\<<C-r>=expand("<cword>")<CR>\>#

" Search and replace using perl regexp engine
nmap <leader><leader>r :%s/\v
vmap <leader><leader>r :s/\v

" Use perl regular expressions syntax by default
" Thanks to Steve Losh for this liberating tip
" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
nnoremap / /\v
vnoremap / /\v

" Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" Indent in and out with Cmd+] and Cmd+[ respectively
if has("mac") || has("macunix")
    nmap <D-[> <<
    nmap <D-]> >>
    vmap <D-[> <gv
    vmap <D-]> >gv
endif

" Bubble single and multiple lines up and down
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" }}}

" Folding {{{

set foldenable                  " enable folding
set foldcolumn=2                " add a fold column
set foldmethod=syntax           " fold according to language syntax
set foldlevelstart=99           " start out with everything folded
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold
function! MyFoldText()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - 4
    return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()

" }}}

" Toggles {{{

" Toggle the quickfix window
" From Steve Losh, http://learnvimscriptthehardway.stevelosh.com/chapters/38.html
nnoremap <C-q> :call <SID>QuickfixToggle()<cr>
let g:quickfix_is_open = 0
function! s:QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

" Toggle relative/absolute line numbers
nnoremap <leader><leader>n :call LineNumbersToggle()<cr>
let g:absolute_line_numbers = 1
function! LineNumbersToggle()
    if g:absolute_line_numbers
        let g:absolute_line_numbers = 0
        set relativenumber
    else
        let g:absolute_line_numbers = 1
        set number
    endif
endfunction

" Toggle the foldcolumn
nnoremap <leader><leader>z :call FoldColumnToggle()<cr>
let g:last_fold_column_width = 4  " Pick a sane default for the foldcolumn
function! FoldColumnToggle()
    if &foldcolumn
        let g:last_fold_column_width = &foldcolumn
        setlocal foldcolumn=0
    else
        let &l:foldcolumn = g:last_fold_column_width
    endif
endfunction

" }}}

" Filetype settings {{{

" only do this part when compiled with support for autocommands
if has("autocmd")
    augroup invisible_chars "{{{
        au!

        " Show invisible characters in all of these files
        autocmd filetype vim setlocal list
        autocmd filetype python,rst setlocal list
        autocmd filetype ruby,yaml setlocal list
        autocmd filetype javascript,css setlocal list
    augroup end "}}}

    augroup vim_files "{{{
        au!

        autocmd filetype vim setlocal foldmethod=marker

        " Bind <F1> to show the keyword under cursor
        " general help can still be entered manually, with :h
        autocmd filetype vim noremap <buffer> <F1> <Esc>:help <C-r><C-w><CR>
        autocmd filetype vim noremap! <buffer> <F1> <Esc>:help <C-r><C-w><CR>
    augroup end "}}}

    augroup html_files "{{{
        au!

        " This function detects, based on HTML content, whether this is a
        " Django template, or a plain HTML file, and sets filetype accordingly
        fun! s:DetectHTMLVariant()
            let n = 1
            while n < 50 && n < line("$")
                " check for django
                if getline(n) =~ '{%\s*\(extends\|load\|block\|if\|for\|include\|trans\)\>'
                    set ft=htmldjango.html
                    return
                endif
                let n = n + 1
            endwhile
            " go with html
            set ft=html
        endfun

        autocmd BufNewFile,BufRead *.html,*.htm,*.j2 call s:DetectHTMLVariant()

        " Auto-closing of HTML/XML tags
        let g:closetag_default_xml=1
        autocmd filetype html,htmldjango let b:closetag_html_style=1
        autocmd filetype html,xhtml,xml source ~/.vim/scripts/closetag.vim
    augroup end " }}}

    augroup python_files "{{{
        au!

        " This function detects, based on Python content, whether this is a
        " Django file, which may enabling snippet completion for it
        fun! s:DetectPythonVariant()
            let n = 1
            while n < 50 && n < line("$")
                " check for django
                if getline(n) =~ 'import\s\+\<django\>' || getline(n) =~ 'from\s\+\<django\>\s\+import'
                    set ft=python.django
                    "set syntax=python
                    return
                endif
                let n = n + 1
            endwhile
            " go with html
            set ft=python
        endfun
        autocmd BufNewFile,BufRead *.py call s:DetectPythonVariant()

        " PEP8 compliance (set 1 tab = 4 chars explicitly, even if set
        " earlier, as it is important)
        autocmd filetype python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
        autocmd filetype python setlocal textwidth=78
        autocmd filetype python match ErrorMsg '\%>120v.\+'

        " But disable autowrapping as it is super annoying
        autocmd filetype python setlocal formatoptions-=t

        " Folding for Python (uses syntax/python.vim for fold definitions)
        "autocmd filetype python,rst setlocal nofoldenable
        "autocmd filetype python setlocal foldmethod=expr

        " Python runners
        autocmd filetype python noremap <buffer> <F5> :w<CR>:!python %<CR>
        autocmd filetype python inoremap <buffer> <F5> <Esc>:w<CR>:!python %<CR>
        autocmd filetype python noremap <buffer> <S-F5> :w<CR>:!ipython %<CR>
        autocmd filetype python inoremap <buffer> <S-F5> <Esc>:w<CR>:!ipython %<CR>

        " Toggling True/False
        autocmd filetype python nnoremap <silent> <C-t> mmviw:s/True\\|False/\={'True':'False','False':'True'}[submatch(0)]/<CR>`m:nohlsearch<CR>

        " Run a quick static syntax check every time we save a Python file
        "autocmd BufWritePost *.py call Flake8()
    augroup end " }}}

    augroup markdown_files "{{{
        au!

        autocmd filetype markdown noremap <buffer> <leader>o :w<CR>:!open %<CR><CR>
    augroup end " }}}

    augroup git_files "{{{
        au!

        autocmd FileType gitconfig setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
        autocmd BufNewFile,BufRead gitconfig setfiletype gitconfig
        autocmd BufReadPost fugitive://* set bufhidden=delete
    augroup end " }}}

    augroup ruby_files "{{{
        au!

        autocmd filetype ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
        autocmd filetype yaml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
        autocmd filetype coffee setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
    augroup end " }}}

    augroup rst_files "{{{
        au!

        " Auto-wrap text around 74 chars
        autocmd filetype rst setlocal textwidth=74
        autocmd filetype rst setlocal formatoptions+=nqt
        autocmd filetype rst match ErrorMsg '\%>74v.\+'
    augroup end " }}}

    augroup css_files "{{{
        au!

        autocmd filetype css,less setlocal foldmethod=marker foldmarker={,}
    augroup end "}}}

    augroup javascript_files "{{{
        au!

        autocmd filetype javascript setlocal expandtab
        autocmd filetype javascript setlocal foldmethod=marker foldmarker={,}

        " Toggling True/False
        autocmd filetype javascript nnoremap <silent> <C-t> mmviw:s/true\\|false/\={'true':'false','false':'true'}[submatch(0)]/<CR>`m:nohlsearch<CR>
    augroup end "}}}

    augroup textile_files "{{{
        au!

        autocmd filetype textile set tw=78 wrap

        " Render YAML front matter inside Textile documents as comments
        autocmd filetype textile syntax region frontmatter start=/\%^---$/ end=/^---$/
        autocmd filetype textile highlight link frontmatter Comment
    augroup end "}}}

    augroup trailing_whitespace "{{{
        au!

        " Delete trailing white space on save for certain types of files
        autocmd BufWrite *.py :FixWhitespace
        autocmd BufWrite *.rb :FixWhitespace
        autocmd BufWrite *.js :FixWhitespace
        autocmd BufWrite *.css :FixWhitespace
        autocmd BufWrite *.coffee :FixWhitespace
    augroup end "}}}

    augroup shell_scripts "{{{
        au!

        autocmd filetype zsh,sh setlocal foldmethod=marker
        autocmd BufNewFile,BufRead *.zsh-theme setfiletype zsh
    augroup end "}}}
endif

" }}}

" Common abbreviations / misspellings {{{

" source ~/.vim/autocorrect.vim

iab lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit
iab llorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi
iab lllorem Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Etiam lacus ligula, accumsan id imperdiet rhoncus, dapibus vitae arcu.  Nulla non quam erat, luctus consequat nisi.  Integer hendrerit lacus sagittis erat fermentum tincidunt.  Cras vel dui neque.  In sagittis commodo luctus.  Mauris non metus dolor, ut suscipit dui.  Aliquam mauris lacus, laoreet et consequat quis, bibendum id ipsum.  Donec gravida, diam id imperdiet cursus, nunc nisl bibendum sapien, eget tempor neque elit in tortor

" }}}

" Behavior improvements {{{

" Restore cursor position upon reopening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Different cursors for insert vs normal mode
if !has("gui_running")
    if $TERM_PROGRAM == 'iTerm.app'
        if exists('$TMUX')
            let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
            let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
        else
            let &t_SI = "\<Esc>]50;CursorShape=1\x7"
            let &t_EI = "\<Esc>]50;CursorShape=0\x7"
        endif
    endif
endif

" Keep search matches in the middle of the window
" and pulse the line when moving to them.
nnoremap n n:call PulseCursorLine()<cr>
nnoremap N N:call PulseCursorLine()<cr>

function! PulseCursorLine()
    let current_window = winnr()

    windo set nocursorline
    execute current_window . 'wincmd w'

    setlocal cursorline

    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    hi CursorLine guibg=#3a3a3a
    redraw
    sleep 20m

    hi CursorLine guibg=#4a4a4a
    redraw
    sleep 30m

    hi CursorLine guibg=#3a3a3a
    redraw
    sleep 30m

    hi CursorLine guibg=#2a2a2a
    redraw
    sleep 20m

    execute 'hi ' . old_hi

    windo set cursorline
    execute current_window . 'wincmd w'
endfunction

" Diff the current buffer against the unmodifed version on disk
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
map <leader><leader>d :DiffSaved<CR>

" }}}

" Various plugin options and key-bindings {{{

" YankRing stuff
let g:yankring_history_dir = '$HOME/.tmp/vim'
nnoremap <leader><leader>y :YRShow<CR>

" Strip all trailing whitespace from a file
nnoremap <leader><leader>w :FixWhitespace<CR>

" Ack for the word under cursor
nnoremap <leader><leader>a :Ack<Space><c-r><c-W>

" Gundo.vim
nnoremap <leader>u :GundoToggle<CR>

" git commands shortcuts
map <leader>st :Gstatus<cr>

" Ctrl-p
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
map <leader>t :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>
map <leader>r :CtrlPMRU<CR>
map <leader>m :CtrlPMixed<CR>
map <leader>g :CtrlPBufTag<CR>

" Powerline
"let g:Powerline_symbols = 'compatible'
let g:Powerline_symbols = 'fancy'

" Smooth scrolling
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 20, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 20, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 30, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 30, 4)<CR>
noremap <silent> <PageUp> :call smooth_scroll#up(&scroll, 20, 2)<CR>
noremap <silent> <PageDown> :call smooth_scroll#down(&scroll, 20, 2)<CR>

" Nested markdown folding
let g:markdown_fold_style = 'nested'

" Toggle quickfix and location lists
let g:toggle_list_no_mappings = 'true'
nmap <script> <silent> <leader><leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader><leader>q :call ToggleQuickfixList()<CR>

" }}}

" vimux and vroom settings {{{

" Invoke tests from within vim
let g:vroom_use_vimux = 1
let g:vroom_write_all = 1
let g:vroom_map_keys = 0
nmap <leader>sf :VroomRunTestFile<CR>
nmap <leader>sn :VroomRunNearestTest<CR>
nmap <leader>sl :VimuxRunLastCommand<CR>
nmap <leader>sr :call VimuxRunCommand('rspec')<CR>

" Custom keybindings for controlling vimux pane
let g:VimuxHeight = "25"
nmap <leader>xp :VimuxPromptCommand<CR>
nmap <leader>xl :VimuxRunLastCommand<CR>
nmap <leader>xq :VimuxCloseRunner<CR>

" }}}

" NERDTree settings {{{

" Put focus to the NERD Tree with F3 (tricked by quickly closing it and
" immediately showing it again, since there is no :NERDTreeFocus command)
nnoremap <leader>f :NERDTreeToggle<CR>

" Store the bookmarks file
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Show hidden files, too
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1

" Quit on opening files from the tree
let NERDTreeQuitOnOpen=1

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Use a single click to fold/uncold directories and a double click
" to open files
let NERDTreeMouseMode=2

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$' ]

" }}}

" TagList settings {{{

nnoremap <leader><leader>g :TlistToggle<CR>

" quit Vim when the TagList window is the last open window
let Tlist_Exit_OnlyWindow=1         " quit when TagList is the last open window
let Tlist_GainFocus_On_ToggleOpen=1 " put focus on the TagList window when it opens
"let Tlist_Process_File_Always=1     " process files in the background, even when the TagList window isn't open
"let Tlist_Show_One_File=1           " only show tags from the current buffer, not all open buffers
let Tlist_WinWidth=40               " set the width
let Tlist_Inc_Winwidth=1            " increase window by 1 when growing

" shorten the time it takes to highlight the current tag (default is 4 secs)
" note that this setting influences Vim's behaviour when saving swap files,
" but we have already turned off swap files (earlier)
"set updatetime=1000

" the default ctags in /usr/bin on the Mac is GNU ctags, so change it to the
" exuberant ctags version in /usr/local/bin
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

" show function/method prototypes in the list
let Tlist_Display_Prototype=1

" don't show scope info
let Tlist_Display_Tag_Scope=0

" show TagList window on the right
let Tlist_Use_Right_Window=1

" }}}

" Surround characters {{{

" Surround word under the cursor while in normal mode
nmap <leader>" ysiw"l
nmap <leader>' ysiw'l
nmap <leader>` ysiw`l
nmap <leader>( ysiw)l
nmap <leader>{ ysiw}l
nmap <leader>[ ysiw]l
nmap <leader>< ysiw>l

" Surround text currently selected while in visual mode
" (The surrounded text is kept selected after being surround)
vmap <leader>" S"lvi"
vmap <leader>' S'lvi'
vmap <leader>` S`lvi`
vmap <leader>( S)lvi(
vmap <leader>{ S}lvi{
vmap <leader>[ S]lvi[
vmap <leader>< S>lvi<

" }}}

" Extra user or machine specific settings {{{

if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif

" }}}
