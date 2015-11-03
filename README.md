# ubuntu-conf

## mount another disk
blkid to get UUID
add line in /etc/fstab
    field#1 dev: UUID=xxxxxxx
    field#2 mount point: /home
    field#3 fs type: ext4
    field#4 opts: nofail
    field#5 dump flag: 0
    field#6 fsck seq: 2

# about sogou pinyin

visit [sogou offical website](http://pinyin.sogou.com/linux/).

    dpkg -i sougoupinyin_*.deb
    apt-get install -f

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

to install matplotlib, should also install libfreetype-dev
to install pyside, should also install qt4-qmake

# about go

## install

download from [golangtc](http://www.golangtc.com/download) or
[offical website](https://golang.org/dl/)

tar -C $HOME/opt -xzf go$VERSION.$OS-$ARCH.tar.gz
mv $HOME/opt/go{,-$VERSION}

export GOROOT=$HOME/opt/go-$VERSION
export PATH=$PATH:$GOROOT/bin
