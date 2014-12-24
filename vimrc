""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugins
" File Tree plugin NERDTree
Plugin 'scrooloose/nerdtree'
" File switch from on to another
Plugin 'kien/ctrlp.vim'
"snippets
Plugin 'SirVer/ultisnips'
" Plugin 'vim-scripts/snipMate'
" Auto complete plugin
Plugin 'Valloric/YouCompleteMe'
" Plugin 'Shougo/neocomplcache.vim'
" Plugin 'SuperTab'
" Code comment and decomment
Plugin 'tomtom/tcomment_vim'
Plugin 'majutsushi/tagbar'
" Static syntax checking
Plugin 'scrooloose/syntastic'
" Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
" write HTML code faster(inspired by zencodeing)
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" ColorScheme
Plugin 'tomasr/molokai'
"Airline
Plugin 'bling/vim-airline'
" Utility
" Plugin 'repeat.vim'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/goyo.vim'
" Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-markdown'
" vimdeck depend on it
Plugin 'SyntaxRange'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""
" miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a
set incsearch
set hlsearch

set colorcolumn=81
highlight ColorColumn ctermbg=52 guibg=#5f0000

""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line config
""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2 "Always show the status line
set t_Co=256

""""""""""""""""""""""""""""""""""""""""""""""""""
" coding-style setting
""""""""""""""""""""""""""""""""""""""""""""""""""
" tabstop = ts
" softtabstop = sts
" shiftwidth = sw
" expandtab = et
autocmd FileType c,cpp set ts=4 sts=4 sw=4 et
autocmd FileType cmake set ts=2 sts=2 sw=2 et
autocmd FileType sh set ts=2 sts=2 sw=2 et

" :N Place case labels N characters from the indent of the switch().
" gN Place C++ scope declarations N characters from the indent of the
"    block they are in.
" NN Indent inside C++ namespace N characters extra compared to a
"    normal block.  (default 0).
set cinoptions=:0,g0,N-s

autocmd FileType c,cpp set foldmethod=marker

fu! CustomFoldText()
  " get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
    let firstline = getline(v:foldstart)
  else
    let firstline = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif
  " get last non-blank line
  let ls = v:foldend
  while getline(ls) =~ '^\s*$' | let fs = prevnonblank(ls - 1)
  endwhile
  if ls < v:foldstart
    let lastline = getline(v:foldend)
  else
    let lastline = substitute(getline(ls), '^\s*', "", '')
  endif
  " for c type commenting remove the foldmarker
  "let firstline = substitute(firstline, '\/\/ {{{', "", 'g')
  "let firstline = substitute(firstline, '\/\/{{{', "", 'g')
  let firstline = substitute(firstline, '\/\*{{{\*\/', "", 'g')
  "let lastline = substitute(lastline, '\/\/ }}}', "", 'g')
  "let lastline = substitute(lastline, '\/\/}}}', "", 'g')
  let lastline = substitute(lastline, '\/\*}}}\*\/', "", 'g')
  " get the content width
  " let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = foldSize . " lines "
  let foldLevelStr = repeat("+–", v:foldlevel)
  let tailSize = strwidth(foldSizeStr.foldLevelStr)
  if strwidth(firstline)+tailSize > 80 - 3 - 5 - 3
    let firstline = strpart(firstline, 0, 80-3-tailSize)
  endif
  if strwidth(lastline) > 5
    let lastline = strpart(lastline, strwidth(lastline)-5)
  endif
  let expansionString = repeat(".", 80 - 7 - tailSize - strwidth(firstline) - strwidth(lastline))
  return firstline." ".expansionString." ".lastline." ... ".foldSizeStr.foldLevelStr
endf

set foldtext=CustomFoldText()
highlight Folded ctermbg=0 ctermfg=220 guibg=#000000 guifg=blue
""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin setting
""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-airline
" More airline-customization please refer to vim-airline doc:
" https://github.com/bling/vim-airline
" Let airline plugin use the arrow effect of powerline
let g:airline_powerline_fonts=1
" *trailing[164] is part of the whitespace extension, disable it
let g:airline_detect_whitespace=0 
" set vim statusbar theme
let g:airline_theme="molokai"

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
