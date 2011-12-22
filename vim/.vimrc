call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab                   " use spaces, not tabs (remove this if you mostly use tabs)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set showmatch                   " and show matches

nmap <leader><space> :noh<cr>


set ruler
set encoding=utf-8
set scrolloff=4
set showmode
set wildmenu
set wildmode=longest,list
set ttyfast
set relativenumber
set laststatus=2
let mapleader = ","
set mouse=
set foldmethod=indent
set foldnestmax=3
nnoremap / /\v
vnoremap / /\v

set textwidth=79
set formatoptions=qrn1 " q = format comments; r = insert comment leader; n = recognise numbered lists, 1 = try to wrap before a one-letter word.
set list
set listchars=tab:▸\ ,eol:¬

nmap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nmap <leader>l :LustyJuggler<cr>
nmap <leader>k :LustyJugglePrevious<cr>
nmap <leader>p :CtrlP<cr>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Make j and k work visually, rather than on actual lines.
nnoremap j gj
nnoremap k gk

let g:yankring_history_dir = '$HOME/.vim/'
nnoremap <silent> <leader>y :YRShow<cr>

set showtabline=0
nmap <leader><tab> :tabnext<cr>
nmap <leader>n :tabnew<cr>

set undofile
set undodir=~/.vim/tmp/undo/

" Ack
set grepformat=%f:%l:%c:%m
nmap <leader>a :Ack 

set wildignore+=*.o,*.obj,.git,*.pyc,build/**,bin/**,include/**,lib/**,man/**,*.db
let g:ctrlp_working_path_mode = 0

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

set t_Co=256
set background=dark
colorscheme molokai

hi ColorColumn ctermbg=235
set colorcolumn=+1

if has("autocmd")
    " Tabs for HTML, CSS & JavaScript. Spaces for Python.
    autocmd FileType css setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType mustache setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType markdown setlocal ts=4 sts=4 sw=4 expandtab

    autocmd BufNewFile,BufRead *.less setlocal filetype=less
    autocmd FileType less setlocal ts=4 sts=4 sw=4 noexpandtab

    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab

    "autocmd VimEnter * RainbowParenthesesToggle
    "autocmd Syntax * RainbowParenthesesLoadRound
    "autocmd Syntax * RainbowParenthesesLoadSquare
    "autocmd Syntax * RainbowParenthesesLoadBraces
endif
