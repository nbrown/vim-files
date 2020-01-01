set nocompatible




" Add pathogen support
" newest version can be found at:
" https://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

set hidden " allow hidden buffers
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
set wildmenu
set wildmode=list:longest
set title
set visualbell
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
scriptencoding utf-8

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ %{ObsessionStatus()}   " obsession status
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

packadd matchit

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


" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>evs :vsp %%
map <leader>et :tabe %%

let g:ale_linters = {'perl6': 'all'}


" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
