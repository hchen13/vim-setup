" Spaces & Tabs '
set tabstop=4           " number of visual spaces per TAB
set shiftwidth=4
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set autoindent

" Colors
colorscheme molokai     " set the color scheme 
syntax enable           " enable syntax highlighting

" UI Config
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching parenthesis-like characters

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Movements
" highlight last inserted text
nnoremap gV `[v`]
set backspace=2         " make backspace work like most other programs

set splitbelow
set splitright

" setting Vundle
set nocompatible 
filetype off            
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'klen/python-mode'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" All of your plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" split navigations key maps
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" set clipboard to unnamed to enable copying and pasting from outside of vim
set clipboard=unnamed

let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_indent = 1
let g:pymode_folding = 1

map <C-k><C-b> :NERDTreeToggle<CR>
