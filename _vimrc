" Add pathogen support
" newest version can be found at:
" https://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
set ignorecase
set smartcase
set wrap!
set nu
set incsearch
set hls
set ruler

syn on

