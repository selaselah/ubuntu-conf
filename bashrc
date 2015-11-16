# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# find function
cppsearch () {
  case $# in
    1) base_dir=.; pattern=$1;;
    2) base_dir=$1; pattern=$2;;
    *) echo "Usage: find [path] pattern" && return ;;
  esac
  echo "start search..."
  find $base_dir -name '*.h' -o -name '*.cpp' -o -name '*.hpp' -o -name '*.cxx' \
    -o -name '*.c' | xargs grep -H --color "$pattern"
}

cssearch () {
  case $# in
    1) base_dir=.; pattern=$1;;
    2) base_dir=$1; pattern=$2;;
    *) echo "Usage: find [path] pattern" && return ;;
  esac
  echo "start search..."
  find $base_dir -name '*.cs' | xargs grep -H --color "$pattern"
}

pysearch () {
  case $# in
    1) base_dir=.; pattern=$1;;
    2) base_dir=$1; pattern=$2;;
    *) echo "Usage: find [path] pattern" && return ;;
  esac
  echo "start search..."
  find $base_dir -name '*.py' | xargs grep -H --color "$pattern"
}

gbk2u8 () {
  case $# in
    1) file=$1;;
    *) echo "Usage: gbk2u8 filename" && return ;;
  esac
  iconv -fgbk -tutf8 $file -o $file.gbk2u8
  if [ $? -ne 0 ]; then
    echo "gbk2u8 convert failed"
    rm $file.gbk2u8
  else
    mv $file.gbk2u8 $file
  fi
}
alias curtime='date +"%Y-%m-%d %H:%M:%S"'
alias curdate='date +"%H:%M:%S"'
alias cd='cd -P'

# colored manpage
# mb   Start blinking, no effect
# md   Start bold mode, for subtitle and bold
# me   End all mode like so, us, mb, md and mr
# mh   Start half bright mode
# mk   Dark mode (Characters invisible)
# ML   Set left soft margin
# mm   Put terminal in meta mode
# mo   Put terminal out of meta mode
# mp   Turn on protected attribute
# mr   Start reverse mode
# MR   Set right soft margin
# us   Start underlining, for underlining

man() {
  env \
    LESS_TERMCAP_mb=$(tput bold; tput setaf 1) \
    LESS_TERMCAP_md=$(tput setaf 2) \
    LESS_TERMCAP_me=$(tput sgr0) \
    LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) \
    LESS_TERMCAP_se=$(tput rmso; tput sgr0) \
    LESS_TERMCAP_us=$(tput smul; tput setaf 3) \
    LESS_TERMCAP_ue=$(tput rmul; tput sgr0) \
    LESS_TERMCAP_mr=$(tput rev) \
    LESS_TERMCAP_mh=$(tput dim) \
    LESS_TERMCAP_ZN=$(tput ssubm) \
    LESS_TERMCAP_ZV=$(tput rsubm) \
    LESS_TERMCAP_ZO=$(tput ssupm) \
    LESS_TERMCAP_ZW=$(tput rsupm) \
    man -a "$@"
}
# for java
export JAVA_HOME=/usr/lib/jvm/java-7-oracle

# for hadoop
export HADOOP_HOME=$HOME/opt/hadoop-2.7.1
export PATH=$PATH:$HADOOP_HOME/bin

# for pig
export PIG_HOME=$HOME/opt/pig-0.15.0
export PATH=$PATH:$PIG_HOME/bin

# for valgrind
export PATH=$PATH:$HOME/opt/valgrind-3.10.1/bin

# for go
export GOROOT=$HOME/opt/go-1.5.1
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
gobuild() {
  file=$1
  if [[ ! $file =~ .go$ ]]; then
    echo "wrong file: $file"
    echo "usage: gobuild xxx.go"
    return
  fi
  file=${file%.go}
  WORK=/tmp/gobuild
  mkdir -p $WORK
  $GOROOT/pkg/tool/linux_amd64/compile -o $WORK/${file}.a ${file}.go
  $GOROOT/pkg/tool/linux_amd64/link -o $file $WORK/${file}.a
}

# for bin
export PATH=$HOME/opt/bin:$PATH

cbuild() {
  file=$1
  if [[ ! $file =~ .c$ ]]; then
    echo "wrong file: $file"
    echo "usage: cbuild xxx.c"
    return
  fi
  shift 1
  gcc -g -o ${file%.c} $file "$@"
}

cppbuild() {
  file=$1
  if [[ ! $file =~ .cpp$ ]]; then
    echo "wrong file: $file"
    echo "usage: cppbuild xxx.cpp"
    return
  fi
  shift 1
  g++ -g -o ${file%.cpp} $file "$@"
}
