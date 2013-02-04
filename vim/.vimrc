set nocompatible
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

let g:flake8_cmd="/usr/local/share/python/flake8"

" let Vundle manage Vundle
" required! 
Bundle 'VimClojure'
Bundle 'gmarik/vundle'
Bundle 'sjl/badwolf'
Bundle 'nvie/vim-flake8'
Bundle 'mileszs/ack.vim'
Bundle 'ctrlp.vim'
Bundle 'html5.vim'
Bundle 'jade.vim'
Bundle 'JuliaLang/julia-vim'
Bundle 'less.vim'
Bundle 'LustyJuggler'
Bundle 'Markdown'
Bundle 'snipMate'
Bundle 'Syntastic'
Bundle 'Tagbar'
Bundle 'The-NERD-Commenter'
Bundle 'unimpaired.vim'
Bundle 'vim-coffee-script'
Bundle 'vim-powerline'
Bundle 'YankRing.vim'


filetype plugin indent on

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
set foldlevelstart=0
set foldmethod=indent
set foldnestmax=3
nnoremap / /\v
vnoremap / /\v

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

set splitright
set splitbelow
set textwidth=79
set formatoptions=qrn1 " q = format comments; r = insert comment leader; n = recognise numbered lists, 1 = try to wrap before a one-letter word.
set list
set listchars=tab:▸\ ,eol:¬

nmap <leader><space> :noh<cr>
nmap <leader>s <C-w><C-v><C-l><cr>
nmap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nmap <leader>es <C-w><C-v><C-l>:e ~/.vim/snippets/<cr>
nmap <leader>l :LustyJuggler<cr>
nmap <leader>k :LustyJugglePrevious<cr>
nmap <leader>p :CtrlP<cr>
nmap <leader>P :CtrlPTag<cr>
nmap <silent> <leader>b :TagbarToggle<cr>
let g:LustyJugglerDefaultMappings = 0

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

" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" Ack
let g:ackprg="ack\\ -H\\ --nocolor\\ --nogroup\\ --ignore-dir=lib\\ --ignore-dir=static\\ --ignore-dir=media\\ --ignore-dir=html_coverage"
"let g:ackprg = 'ag --nogroup --nocolor --column'
nmap <leader>a :Ack 

set wildignore+=*.o,*.obj,.git,*.pyc,build,bin,include,lib,man,*.db
let g:ctrlp_working_path_mode = 0

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

let g:Powerline_symbols = 'fancy'
set guifont=Ubuntu\ Mono:h14

set t_Co=256
set background=dark
colorscheme badwolf

set colorcolumn=+1

hi ColorColumn ctermbg=235

if has("autocmd")
    " Tabs for HTML, CSS & JavaScript. Spaces for Python.
    autocmd FileType css setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType htmldjango setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType mustache setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType markdown setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType php setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType python set ft=python.django

    autocmd BufNewFile,BufRead *.less setlocal filetype=less
    autocmd FileType less setlocal ts=4 sts=4 sw=4 noexpandtab

    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType haskell setlocal ts=2 sts=2 sw=2 expandtab

    autocmd BufNewFile,BufRead *.cljs setlocal filetype=clojure
    autocmd FileType clojure setlocal ts=2 sts=2 sw=2 expandtab

    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red ctermbg=3
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
endif

