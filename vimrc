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
" tab
""""""""""""""""""""""""""""""""""""""""""""""""""
" tabstop = ts
" softtabstop = sts
" shiftwidth = sw
" expandtab = et
autocmd FileType cpp set ts=4 sts=4 sw=4 et
autocmd FileType cmake set ts=2 sts=2 sw=2 et
