""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins
" [V] File Tree plugin NERDTree
Plugin 'scrooloose/nerdtree'
" [V] File switch from on to another
Plugin 'kien/ctrlp.vim'
" [V] snippets
Plugin 'SirVer/ultisnips'
" [V] Auto complete plugin
Plugin 'Valloric/YouCompleteMe'
" [V] c++ highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'
" [V] hightlight tag
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
" [X] contained in YouCompleteME
" Plugin 'Shougo/neocomplcache.vim'
" Plugin 'SuperTab'
" [V] Code comment and decomment
Plugin 'tomtom/tcomment_vim'
" [V] Tagbar
Plugin 'majutsushi/tagbar'
" [V] Static syntax checking
Plugin 'scrooloose/syntastic'
" [V] git
Plugin 'tpope/vim-fugitive'
" [V] EasyMotion
Plugin 'Lokaltog/vim-easymotion'
" [V] write HTML code faster(inspired by zencodeing)
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" [V] ColorScheme, switch to my fork
" Plugin 'tomasr/molokai'
Plugin 'selaselah/molokai'

" [V] Airline
Plugin 'bling/vim-airline'
" [X] Utility
" Plugin 'repeat.vim'
" [V] vim-surround
Plugin 'tpope/vim-surround'
" [V] goyo mode
Plugin 'junegunn/goyo.vim'
" [V] vimdeck depend on it
Plugin 'SyntaxRange'
" [V] python indent
Plugin 'hynek/vim-python-pep8-indent'
" [V] ansi color
Plugin 'powerman/vim-plugin-AnsiEsc'
" [V] Markdown
Plugin 'tpope/vim-markdown'
" [V] csv
Plugin 'chrisbra/csv.vim'
" [V] thrift
Plugin 'solarnz/thrift.vim'
" [V] rust
Plugin 'rust-lang/rust.vim'
" [V] toml
Plugin 'cespare/vim-toml'
" [V] pig
Plugin 'motus/pig.vim'
" [V] go
Plugin 'fatih/vim-go'

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

" set vertical bar on col 81
set colorcolumn=81
highlight ColorColumn ctermbg=52 guibg=#5f0000

" date & time funtion
fu! CurTime()
  call setline(line('.'), getline('.') . ' ' . strftime('%Y-%m-%d %H:%M:%S'))
endf
fu! CurDate()
  call setline(line('.'), getline('.') . ' ' . strftime('%Y-%m-%d'))
endf

" move swp file in .vim/direcotry
if filewritable(".") && ! filewritable("~/.vim/directory")
  silent execute '!umask 002; mkdir -p ~/.vim/directory'
endif
set directory=~/.vim/directory//

""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax hightlighting
""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme molokai
let g:molokai_reduce_bold=1
set t_ZH=[3m
set t_ZR=[23m

" this map return syntax_id_name
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

let g:load_doxygen_syntax=1
let g:doxygen_enhanced_color=1

highlight link cPreProcTag Constant
" " string -----------------------------------------
" autocmd FileType cpp syn keyword cppType basic_string
" autocmd FileType cpp syn keyword cppType string wstring u16string u32string
" " container --------------------------------------
" " sequence container
" autocmd FileType cpp syn keyword cppType array vector deque forward_list list
" " associative container
" autocmd FileType cpp syn keyword cppType set map multiset multimap string
" " unordered associative container
" autocmd FileType cpp syn keyword cppType unordered_set unordered_map
"       \unordered_multiset unordered_multimap
" " container adaptors
" autocmd FileType cpp syn keyword cppType stack queue priority_queue
" " I/O --------------------------------------------
" " I/O abstraction
" autocmd FileType cpp syn keyword cppType ios_base basic_ios basic_streambuf
"       \basic_istream basic_ostream basic_iostream
" autocmd FileType cpp syn keyword cppType ios wios streambuf wstreambuf
" autocmd FileType cpp syn keyword cppType istream wistream ostream wostream 
"       \iostream wiostream
" " file I/O
" autocmd FileType cpp syn keyword cppType basic_filebuf basic_ifstream
"       \basic_ofstream basic_fstream
" autocmd FileType cpp syn keyword cppType filebuf wfilebuf
" autocmd FileType cpp syn keyword cppType ifstream wifstream ofstream wofstream
"       \fstream wfstream
" " string I/O
" autocmd FileType cpp syn keyword cppType basic_stringbuf basic_istringstream
"       \basic_ostringstream basic_stringstream
" autocmd FileType cpp syn keyword cppType stringbuf wstringbuf
" autocmd FileType cpp syn keyword cppType istringstream wistringstream
"       \ostringstream wostringstream stringstream wstringstream
" " array I/O
" autocmd FileType cpp syn keyword cppType strstreambuf istrstream ostrstream
"       \strstream
" " predefined
" autocmd FileType cpp syn keyword cppIdentifier cin wcin cout wcout cerr wcerr
"       \clog wclog
" " type
" autocmd FileType cpp syn keyword cppType streamoff streamsize fpos
" autocmd FileType cpp syn keyword cppType streampos u16streampos u32streampos
"
" autocmd FileType cpp syn keyword cppOperator hex dec boolalpha noboolalpha endl
"
" highlight default link cppIdentifier Identifier
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
autocmd FileType c set ts=4 sts=4 sw=4 et
autocmd FileType cpp set ts=2 sts=2 sw=2 et
autocmd FileType go set ts=4 sts=4 sw=4
autocmd FileType cmake set ts=2 sts=2 sw=2 et
autocmd FileType sh set ts=2 sts=2 sw=2 et
autocmd FileType vim set ts=4 sts=4 sw=4 et
autocmd FileType perl set ts=2 sts=2 sw=2 et
autocmd FileType markdown set ts=4 sts=4 sw=4 et
autocmd FileType thrift set ts=2 sts=2 sw=2 et
autocmd FileType html set ts=2 sts=2 sw=2 et

" :N Place case labels N characters from the indent of the switch().
"    (default 'shiftwidth').
" =N Place statements occurring after a case label N characters from
"    the indent of the label.  (default 'shiftwidth').
" gN Place C++ scope declarations N characters from the indent of the
"    block they are in.
" hN Place statements occurring after a C++ scope declaration N
"    characters from the indent of the label.  (default 'shiftwidth').
" NN Indent inside C++ namespace N characters extra compared to a
"    normal block.  (default 0).
autocmd FileType cpp set cinoptions=:0.5s,=0.5s,g0.5s,h0.5s,N-s

autocmd FileType c,cpp set foldmethod=marker
autocmd FileType python set foldmethod=indent foldlevel=19

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
  let firstline = substitute(firstline, '\s*\/\*{{{\*\/\s*', "", 'g')
  let lastline = substitute(lastline, '\s*\/\*.*\*\/\s*', "", 'g')
  let lastline = substitute(lastline, '\s*\/\/.*', "", 'g')
  " get the content width
  " let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " ".foldSize." ln "
  let foldLevelStr = repeat("+", v:foldlevel)
  let tailSize = strwidth(foldSizeStr.foldLevelStr)
  let totalSize = strwidth(firstline) + 2 + strwidth(lastline) + tailSize
  if totalSize > 80
    " +75 means -4(len of " .. ") -1(len of tail) +80
    let firstline = strpart(firstline, 0, strwidth(firstline)+75-totalSize)
        \." .. ".strpart(firstline, strwidth(firstline)-1)
    let expansionString = "  "
  else
    let expansionString = " ".repeat(".", 80-totalSize)." "
  endif
  return firstline.expansionString.lastline.foldSizeStr.foldLevelStr
endf
autocmd FileType c,cpp set foldtext=CustomFoldText()

" Don't indent template
function! CppNoTemplateIndent()
  let l:cline_num = line('.')
  let l:cline = getline(l:cline_num)
  let l:pline_num = prevnonblank(l:cline_num-1)
  let l:pline = getline(l:pline_num)
  while l:pline =~# '\(^\s*{\s*\|^\s*//\|^\s*/\*\|\*/\s*$\)'
    " \(^\s*{\s*|^\s*//|^\s*/\*|\*/\s*$)"
    let l:pline_num = prevnonblank(l:pline_num-1)
    let l:pline = getline(l:pline_num)
  endwhile
  let l:retv = cindent('.')
  let l:pindent = indent(l:pline_num)
  if l:pline =~# '^\s*template\s*<.*>\s*$'
    " prev line is template < >$
    let l:retv = l:pindent
  elseif l:pline =~# '^\s*template\s*<.*$'
    let l:retv = l:pindent+&shiftwidth
    " prev line is typename T
  elseif l:pline =~# '\s*\(typename\|class\)\s*.*,\s*$'
    let l:retv = l:pindent
    " prev line is >$
  elseif l:cline =~# '^\s*>\s*$'
    let l:retv = l:pindent-&shiftwidth
    " prev line is typename T>
  elseif l:pline =~# '\s*\(typename\|class\)\s*.*>\s*$'
    let l:retv = l:pindent-&shiftwidth
  endif
  return l:retv
endfunction

autocmd FileType cpp setlocal indentexpr=CppNoTemplateIndent()

" color folded
highlight Folded ctermbg=0 ctermfg=220 guibg=#000000 guifg=blue
""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin setting
""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-airline
" More airline-customization please refer to vim-airline doc:
" https://github.com/bling/vim-airline
" Let airline plugin use the arrow effect of powerline
let g:airline_powerline_fonts=1
" *trailing[164] is part of the airline-whitespace extension, disable it
let g:airline#extensions#whitespace#enabled = 0
" set vim statusbar theme
let g:airline_theme="molokai"
" let vim support object-oriented programming
call airline#parts#define_accent('🐘', 'purple')
let g:airline_section_a = airline#section#create(["🐘", ' ', "mode", "🐘"])

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0

" Syntastic
let g:syntastic_python_python_exec = '/usr/bin/env python3'
