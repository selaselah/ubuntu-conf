ubuntu-conf
===========

for airline vim-plugin

wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

about sogou pinyin
==================

visit [sogou offical website](http://pinyin.sogou.com/linux/).

# about python
configure
--prefix=$PREFIX --enable-shared
to build python component, should install packages:
    _bz2            libbz2-dev
    _curses         libncurses5-dev
    _curses_panel   libncurses5-dev
    _dbm            --not needed--
    _gdbm           --not needed--
    _lzma           liblzma-dev
    _sqlite3        libsqlite3-dev
    _tkinter        tk8.6-dev
    readline        libreadline-dev 

# about go

## install

download from [golangtc](http://www.golangtc.com/download) or
[offical website](https://golang.org/dl/)

tar -C $HOME/opt -xzf go$VERSION.$OS-$ARCH.tar.gz
mv $HOME/opt/go{,-$VERSION}

export GOROOT=$HOME/opt/go-$VERSION
export PATH=$PATH:$GOROOT/bin

