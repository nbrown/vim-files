set nocompatible




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
set splitright " causes the new window to be on the right
set splitbelow " causes the new window to be on the bottom
set mouse=a
set mousehide
scriptencoding utf-8

colorscheme darkblue
set background=dark         " Assume a dark background

" Allow to trigger background
function! ToggleBG()
    let s:tbg = &background
    " Inversion
    if s:tbg == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction


" Set leader and localleader prior to setting any mappings
let mapleader = ','
let maplocalleader = '_'

noremap <leader>bg :call ToggleBG()<CR>

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk



noremap <leader>ev :split $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>

" Toggle search highlighting
nmap <silent> <leader>/ :set invhlsearch<CR>


syntax on

command! -bar -nargs=0 Bigger  :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)+1','')
command! -bar -nargs=0 Smaller :let &guifont = substitute(&guifont,'\d\+$','\=submatch(0)-1','')
noremap <M-,>        :Smaller<CR>
noremap <M-.>        :Bigger<CR>
