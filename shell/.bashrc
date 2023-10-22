# source global definitions; Fedora
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# vi mode
set -o vi && bind -m vi-command 'Control-l: clear-screen' && bind -m vi-insert 'Control-l: clear-screen'

# color shell
[[ $HOSTNAME = home ]] && export PS1="\[\033[38;5;51m\]\u\[$(tput sgr0)\]\[\033[38;5;118m\]@\[$(tput sgr0)\]\[\033[38;5;13m\]\H\[$(tput sgr0)\]:\w\[$(tput sgr0)\]\[\033[38;5;9m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"
[[ $HOSTNAME = work ]] && export PS1="\[\033[38;5;51m\]\u\[$(tput sgr0)\]\[\033[38;5;118m\]@\[$(tput sgr0)\]\[\033[38;5;13m\]\H\[$(tput sgr0)\]:\w\[$(tput sgr0)\]\[\033[38;5;9m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"
[[ $HOSTNAME = work2 ]] && export PS1="\[\033[38;5;51m\]\u\[$(tput sgr0)\]\[\033[38;5;118m\]@\[$(tput sgr0)\]\[\033[38;5;13m\]\H\[$(tput sgr0)\]:\w\[$(tput sgr0)\]\[\033[38;5;9m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]\\$ \[$(tput sgr0)\]"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTIGNORE="ls:ll:ps:du:df:pwd:history:"

# add timestamp
HISTTIMEFORMAT="%F %T: "

# append to the history file, don't overwrite it
shopt -s histappend

# persist commands to .bash_history when using multiple terminals
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# alias definitions
[ -f ~/.aliasrc ] && . ~/.aliasrc

if [ -f ~/.aliasrc ]; then
    . ~/.aliasrc
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).; Debian
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
