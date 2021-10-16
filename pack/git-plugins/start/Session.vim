let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dotfiles/vim/.vim/pack/git-plugins/start
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 vim-dap/autoload/dap.vim
badd +5 vim-dap/t/01-header.vader
badd +1 ~/dotfiles/vim/.vim/vimscript_cheatsheet.md
badd +1 ~/projects/debug-adapter-protocol/specification.md
badd +10 \[Vader]
argglobal
silent! argdel *
$argadd vim-dap/autoload/dap.vim
$argadd vim-dap/t/01-header.vader
$argadd ~/dotfiles/vim/.vim/vimscript_cheatsheet.md
$argadd ~/projects/debug-adapter-protocol/specification.md
edit vim-dap/autoload/dap.vim
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 24 + 37) / 75)
exe '2resize ' . ((&lines * 24 + 37) / 75)
exe 'vert 2resize ' . ((&columns * 65 + 57) / 115)
exe '3resize ' . ((&lines * 23 + 37) / 75)
exe 'vert 3resize ' . ((&columns * 65 + 57) / 115)
exe '4resize ' . ((&lines * 24 + 37) / 75)
exe 'vert 4resize ' . ((&columns * 49 + 57) / 115)
exe '5resize ' . ((&lines * 23 + 37) / 75)
exe 'vert 5resize ' . ((&columns * 49 + 57) / 115)
argglobal
if bufexists('/usr/local/Cellar/macvim/8.1-149_1/MacVim.app/Contents/Resources/vim/runtime/doc/usr_41.txt') | buffer /usr/local/Cellar/macvim/8.1-149_1/MacVim.app/Contents/Resources/vim/runtime/doc/usr_41.txt | else | edit /usr/local/Cellar/macvim/8.1-149_1/MacVim.app/Contents/Resources/vim/runtime/doc/usr_41.txt | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 640 - ((0 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
640
normal! 057|
wincmd w
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 28 - ((12 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
28
normal! 031|
wincmd w
argglobal
if bufexists('vim-dap/t/01-header.vader') | buffer vim-dap/t/01-header.vader | else | edit vim-dap/t/01-header.vader | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 8 - ((7 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
8
normal! 0
wincmd w
argglobal
if bufexists('~/dotfiles/vim/.vim/vimscript_cheatsheet.md') | buffer ~/dotfiles/vim/.vim/vimscript_cheatsheet.md | else | edit ~/dotfiles/vim/.vim/vimscript_cheatsheet.md | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
if bufexists('~/projects/debug-adapter-protocol/specification.md') | buffer ~/projects/debug-adapter-protocol/specification.md | else | edit ~/projects/debug-adapter-protocol/specification.md | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 47 - ((7 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
47
normal! 09|
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 24 + 37) / 75)
exe '2resize ' . ((&lines * 24 + 37) / 75)
exe 'vert 2resize ' . ((&columns * 65 + 57) / 115)
exe '3resize ' . ((&lines * 23 + 37) / 75)
exe 'vert 3resize ' . ((&columns * 65 + 57) / 115)
exe '4resize ' . ((&lines * 24 + 37) / 75)
exe 'vert 4resize ' . ((&columns * 49 + 57) / 115)
exe '5resize ' . ((&lines * 23 + 37) / 75)
exe 'vert 5resize ' . ((&columns * 49 + 57) / 115)
tabnext 1
if exists('s:wipebuf') && s:wipebuf != bufnr('%')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filmnrxoOtT
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
let g:this_obsession_status = 2
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
