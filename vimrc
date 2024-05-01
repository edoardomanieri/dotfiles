" Install vim-plug if not installed

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-surround'

call plug#end()

" Use a line cursor within insert mode and a block cursor everywhere else.
" "
" " Reference chart of values:
" "   Ps = 0  -> blinking block.
" "   Ps = 1  -> blinking block (default).
" "   Ps = 2  -> steady block.
" "   Ps = 3  -> blinking underline.
" "   Ps = 4  -> steady underline.
" "   Ps = 5  -> blinking bar (xterm).
" "   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Show a few lines of context around the cursor. Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=20
set number
set relativenumber
set expandtab           " enter spaces when tab is pressed
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

set ignorecase          " ignore case when searching
set smartcase           " automatically switch to case sensitive if mixed search

" make backspaces more powerfull
set backspace=indent,eol,start

" Do incremental searching.
set incsearch

" Don't use Ex mode, use Q for formatting.
map Q gq

let mapleader = "\<Space>"

map <leader>p "0p
 
" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
