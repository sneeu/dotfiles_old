" Use the homebrew version of ctags, rather than Mac OS's version
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'

" Load Pathogen plugins.
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Allows us to jump between HTML tags, and more.
runtime macros/matchit.vim

" Don't care about Vi, only Vim.
set nocompatible

" Don't beep -- I usually press Esc twice.
set visualbell

" Backspace works everywhere(?) in insert mode.
set backspace=indent,eol,start

" Auto-indent when Enter is pressed in insert mode.
set autoindent

" Have 50 lines of command history.
set history=50

" Show the current cursor position.
set ruler

" Show incomplete commands.
set showcmd

" Set encoding to UTF-8.
set encoding=utf-8

" Always try to show 4 lines above and below the current line.
set scrolloff=4

" Show the current mode.
set showmode

" Allows unsaved files to be hidden.
set hidden

" Allow tab completion in the command window.
set wildmenu
set wildmode=longest,list

" We're on a fast terminal connection.
set ttyfast

" Show line numbers in the gutter.
set number

" Always show a status line.
set laststatus=2

" Set the leader to ',', which is fairly common.
let mapleader = ","

"" Searching
" Use normal style regexes, rather than Vim's own style.
nnoremap / /\v
vnoremap / /\v

" Ignore case, unless the regex has uppercase characters.
set ignorecase
set smartcase

" Show partial matches.
set incsearch
set showmatch

" Highlight search results.
set hlsearch

" Search patterns are global by default.
set gdefault
map <leader><space> :noh<cr>

" Wrapping
set wrap
set textwidth=79
set formatoptions=qrn1 " q = format comments; r = insert comment leader; n = recognise numbered lists, 1 = try to wrap before a one-letter word.

" Use the same symbols as TextMate for tabstops and EOLs
set list
set listchars=tab:▸\ ,eol:¬

" Don't allow use of the arrow keys in normal mode.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Make j and k work visually, rather than on actual lines.
nnoremap j gj
nnoremap k gk

" Sort CSS properties
map <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Use syntax highlighting, and highlight search results.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Ack
map <leader>a :Ack 

" NERD Tree
map <F2> :NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$']

" Yankring
let g:yankring_history_dir = '$HOME/.vim/'
nnoremap <silent> <F3> :YRShow<cr>
nnoremap <silent> <leader>y :YRShow<cr>

" Gundo
map <F4> :GundoToggle<cr>

" Scratch
nmap <leader><tab> :Sscratch<cr><C-W>x<C-j>:resize 15<cr>

" Safe undo states.
set undofile
set undodir=~/.vim/tmp/undo/

" Edit vimrc and snippets stuff.
nmap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nmap <leader>es <C-w><C-v><C-l>:e ~/.vim/snippets/<cr>

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" Stop it, hash key
inoremap # X<BS>#

" Close tags.
inoremap <C-_> <Space><BS><Esc>:call InsertCloseTag()<cr>a

" Quickly switch to Django template syntax.
nnoremap _dj :set ft=htmldjango<CR>
nnoremap _ht :set ft=html<CR>

" Command-T ignore files
set wildignore+=*.o,*.obj,.git,*.pyc,build/**,bin/**,include/**,lib/**,man/**,*.db
map <leader>t :CommandT<cr>
map <leader>T :CommandTFlush<cr>

" Map Control-movements to split movements.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" A function to strip trailing whitespace.
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Map F5 to strip trailing whitespace.
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

if has('gui_running')
    " Set the font to Menlo.
    set guifont=Andale\ Mono:h13

    " Set the colour scheme.
    set background=dark
    " colorscheme molokai
    colorscheme solarized

    " Start-up in full screen.
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen

    " Hide the Mac-style scroll bars.
    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R
endif

" By default, use 4 spaces for a tab.
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

if has("autocmd")
    " Enable file type detection
    filetype plugin indent on

    " Tabs for HTML, CSS & JavaScript. Spaces for Python.
    autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType css setlocal ts=4 sts=4 sw=4 noexpandtab

    autocmd BufNewFile,BufRead *.less setlocal filetype=less
    autocmd FileType less setlocal ts=4 sts=4 sw=4 noexpandtab

    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab

    " Highlight lines over 80 characters long.
    set colorcolumn=+1
endif

map <f12> :!/usr/local/bin/ctags -R .<cr>
