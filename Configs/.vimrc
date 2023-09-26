"We do plugins first, because I may want to reconfigure later
"Vundle Plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Add plugins here
Plugin 'VundleVim/Vundle.vim'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'ervandew/supertab'
call vundle#end()
"Pathogen
execute pathogen#infect()

"config tab complete (base of supertab)
set complete-=i

filetype plugin indent on

"IBeam for insert and block for escape
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
"template files
augroup templates
  autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
  autocmd BufNewFile scratch.c 0r ~/.vim/templates/skeleton.c
  autocmd BufNewFile main.c 0r ~/.vim/templates/skeleton.c
  autocmd BufNewFile scratch.cpp 0r ~/.vim/templates/skeleton.c
  autocmd BufNewFile main.cpp 0r ~/.vim/templates/skeleton.c
  autocmd BufNewFile Main.java 0r ~/.vim/templates/skeleton.java
augroup END

"toggle line numbers
set nu
"set the shiftwidth by default
set sw=2
set tabstop=2
set expandtab
set textwidth=80
"toggle autoindent
set autoindent
"turn on a colorline at 81 characters (so you should never put something at that
"length and change it's color to default text
set colorcolumn=81
highlight ColorColumn ctermbg=2
"make highlighted words stay highlighted
set hlsearch
"Folding stuff
"Nice highlight color comp 
"https://siatwe.wordpress.com/2018/03/23/vim-ctermfg-and-ctermbg-color-values/
set foldmethod=indent
set foldlevelstart=30
hi Folded ctermbg=DarkGrey
"always show filename
set laststatus=2

"remap increment number to ctrl+i so works with tmux
nnoremap <C-i> <C-a>
"remap Y to y$ to be more consistent with D
nnoremap Y y$


"python specific
autocmd FileType python setlocal softtabstop=4 sw=4 tabstop=4
"txt specific
autocmd FileType txt setlocal textwidth=80
"tsv specific
"autocmd BufWinEnter let b:SuperTabNoCompleteAfter=['.']

"for vimdiff
if &diff
  "credit
  "https://stackoverflow.com/questions/2019281/load-different-colorscheme-when-using-vimdiff
  highlight DiffAdd    cterm=bold ctermbg=6
  highlight DiffDelete cterm=bold ctermbg=6
  highlight DiffChange cterm=bold ctermbg=6
  highlight DiffText   cterm=bold ctermbg=3
endif

"functions
function! Ppdf()
  hardcopy > $HOME/.vim/tmp.ps
  echom system("ps2pdf $HOME/.vim/tmp.ps out.pdf")
  echom system("rm $HOME/.vim/tmp.ps")
endfunction

command ToPdf :call Ppdf()

"copy paste
vmap <Space> :w! $HOME/.vim/tmpClipboard<CR>
nmap <Space> :r $HOME/.vim/tmpClipboard<CR>

