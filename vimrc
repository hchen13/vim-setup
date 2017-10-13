" Spaces & Tabs '
set tabstop=4           " number of visual spaces per TAB
set shiftwidth=4
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces

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

