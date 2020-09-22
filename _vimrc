" use vim settings rather than vi settings
" must be the first option set because it changes other options
set nocompatible

filetype plugin indent on

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden " allow hidden buffers

" Diable modelines for security
" multiple exploits have enabled arbitrary code execution via modelines, so
" they should be disabled for safety
set modelines=0 " look for modeline 0 lines from top or bottom (aka, don't look for modelines)
set nomodeline  " disable modeline capability


" maintain undo history across sessions
set undofile            " saye undo history to a file on a per file basis
set undodir=~/.vim/undo " where undo history files are stored
set noswapfile

" support simple fuzzy find
set path+=**

" support enhanced command line completion
set wildmenu                   " support completion
set wildmode=longest,list,full " complet to longest common string, then list alts, then cycle through
set wildignorecase             " case is ignored when comleting filenames & directories
" ignore files vim doesnt use
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*

" search settings
" smart case insensitive search
set ignorecase " ignore case when searching
set smartcase  " unless there is an uppercase char in the search
"set infercase  " when completing in insert mode, complete using the typed
"               " case, not the case of the match
set incsearch  " incremental search
set hlsearch   " highlight search results
if has("nvim")
    set inccommand=split " shows effects of a command incrementally in a preview window
endif

" make backspace smarter
set backspace=indent,eol,start " allow backspace over autoindent, eol, &
                               " beginning of an indent

" indenting
set tabstop=4    " indent every n columns
set shiftwidth=4 " use n spaces indents
set expandtab    " insert spaces instead of tabs

set autoindent  " use indent from previous line
set smartindent " do smart indenting based on some syntax rules
set smarttab    " uses shiftwidth in fron of a line and tabstop or softtabstop in others

" display options
set showmatch " show matching brackets / parenthesis
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set cursorline   " hightlight the current line
" set cursorcolumn " hightlight the current line

set showcmd     " show incomplete cmds
set showmode    " show current mode

set nowrap
set number      " display line numbers
set ruler      " display the cursor position
set splitright " causes the new window to be on the right
set splitbelow " causes the new window to be on the bottom
set mouse=a
set mousehide
set title
set visualbell
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
scriptencoding utf-8

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    " set statusline+=%{fugitive#statusline()} " Git Hotness
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
noremap <M-,>        :Smaller<CR>      " display the cursor position
noremap <M-.>        :Bigger<CR>


" Shortcuts
" Change Working Directory to that of the current file
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
