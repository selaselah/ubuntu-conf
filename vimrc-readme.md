## install vim
use vim-athena instead of vim

## install vundle

get from git:

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## airline font

wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

## youcompleteme

need cmake g++ python-dev libclang-dev
run these command:

    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer --system-libclang

## "object oriented programming"
install ttf-ancient-fonts

add emoji character into airline, see vimrc for more informations
