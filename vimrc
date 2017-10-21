" Spaces & Tabs '
set tabstop=4           " number of visual spaces per TAB
set shiftwidth=4
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set autoindent

" Colors
colorscheme monokai     " set the color scheme 
syntax enable           " enable syntax highlighting
let python_highlight_all = 1

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
set textwidth=119

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
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Valloric/YouCompleteMe'
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

" commenting
let s:comment_map = { 
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " " 
            " Uncomment the line
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else 
            if getline('.') =~ "^\\s*" . comment_leader
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                " Comment the line
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction

nnoremap <leader>/ :call ToggleComment()<cr>
vnoremap <leader>/ :call ToggleComment()<cr>

let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_indent = 1
let g:pymode_folding = 1

let NERDTreeIgnore = ['\.pyc$']
map <C-k><C-b> :NERDTreeToggle<CR>

" pymode auto completion
let g:pymode_rope_completion = 0
let g:pymode_rope_completion_on_dot = 0
let g:pymode_rope_autoimport = 0
let g:pymode_rope_autoimport_modules = ['os', 'datetime', 'django', 'math']
let g:pymode_rope_autoimport_import_after_complete = 0

" youcompleteme configs
let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_collect_identifiers_from_tags_files = 1           " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1                       " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1                  " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1                          " Completion in comments
let g:ycm_complete_in_strings = 1                           " Completion in string
map <C-y> :YcmCompleter GoToDefinitionElseDeclaration<CR>
