set tabstop=8 shiftwidth=8
set autoindent
set smartindent
set cindent
syntax enable
set number
set relativenumber
set autoindent
set smarttab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/vim-airline/vim-airline'
Plug '907th/vim-auto-save'

call plug#end()

filetype on
filetype indent on
set bg=dark
set wrap
colorscheme elflord
