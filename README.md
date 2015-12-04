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

## about sogou pinyin

visit [sogou offical website](http://pinyin.sogou.com/linux/).

    dpkg -i sougoupinyin_*.deb
    apt-get install -f

## about python
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

## use pypi mirror
create ~/.pip/pip.conf
    [global]
    index-url = http://mirrors.aliyun.com/pypi/simple/
    [install]
    use-mirrors = true
    mirrors = http://mirrors.aliyun.com/pypi/
    trusted-host = mirrors.aliyun.com

## install scipy
dependencies: liblapack-dev, libopenblas-dev, gfortran

## install matplotlib
dependencies: libpng12-dev, libfreetype6-dev
## install go

download from [golangtc](http://www.golangtc.com/download) or
[offical website](https://golang.org/dl/)

tar -C $HOME/opt -xzf go$VERSION.$OS-$ARCH.tar.gz
mv $HOME/opt/go{,-$VERSION}

## cherrytree color
黄色 #FFFF00

## add proxy cert
sudo cp foo.crt /usr/local/share/ca-certificates/extra/foo.crt
sudo dpkg-reconfigure ca-certificates

## install oracle jdk
add-apt-repository ppa:webupd8team/java
apt-get install oracle-java7-installer

