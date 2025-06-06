# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

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
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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


######## own custom settings ###########
# nvim settings
export EDITOR='nvim'
export VISUAL='nvim'
alias vim="nvim"
alias vi="nvim"
alias v="nvim" 
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="/usr/local/n/versions/node/$(n --version)/bin:$PATH"

# aliases
alias av="source ./venv/bin/activate"
alias dv="deactivate"
alias xclip='xclip -selection clipboard'
alias ggd='cd ~/projects/iter_python/IMAS-ParaView/ && av'
alias pcn='cd ~/projects/preconnet && poetry shell'
alias val='cd ~/projects/iter_python/ids-validator && av'
alias wave='cd ~/projects/iter_python/Waveform-Editor && av'

# ls aliases
alias ls='ls -hN --color=auto --group-directories-first'
alias ll='ls -al'
alias la='ls -A'
alias l='ls'

# keybinds
bind '"\C-h":backward-kill-word'

# Open tmux on startup
if [ -z "$TMUX" ]; then
  tmux attach -d || tmux
fi

# Git aliases
alias git_purge='git branch --merged | grep -v "\\*" | xargs -n 1 git branch -d'
alias gco="git checkout"
alias gcod="git checkout develop"
alias gcom="git checkout main || git checkout master"
alias gcob="git checkout -b"

alias gac="git add . && git commit -S -m"
alias ga="git add"
alias gb="git branch"
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git log --oneline"
alias grh="git reset --hard"
alias gst="git stash"
alias gstp="git stash pop"
alias gsta="git stash apply"
alias gstl="git stash list"

alias gf="git fetch"
alias gp="git push"
alias gpf!="git push --force-with-lease"
alias gpl="git pull"
alias gc="git commit -S -m"
alias gca="git commit -S --amend --no-edit"

# Enable autocompletion for the functions
if [ -f /usr/share/bash-completion/completions/git ]; then
  source /usr/share/bash-completion/completions/git
elif [ -f /etc/bash_completion.d/git ]; then
  source /etc/bash_completion.d/git
fi

__git_complete ga _git_add
__git_complete gb _git_branch
__git_complete gco _git_checkout
__git_complete gcb _git_checkout
# Petsc
export PETSC_ARCH=arch-linux-c-opt
export PETSC_DIR=/home/sebbe/projects/preconnet-solver/petsc
export PETSC_LIB_DIR=$PETSC_DIR/$PETSC_ARCH/lib
export PETSC_INC_DIR=$PETSC_DIR/$PETSC_ARCH/include
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PETSC_LIB_DIR
export PRECONNET_SOLVER_DIR=/home/sebbe/projects/preconnet-solver
export PRECONNET_SOLVER_LIB_DIR=$PRECONNET_SOLVER_DIR/build/lib/Debug
. "$HOME/.cargo/env"
