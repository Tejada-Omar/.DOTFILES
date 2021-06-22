#!/bin/bash

export EDITOR=nvim
export BAT_THEME="ansi"
export RANGER_LOAD_DEFAULT_RC=FALSE

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use bat as a colorizing pager for man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export READER=zathura

# Commands I forget
alias ls='exa'
alias vim='nvim'
alias find='fd'

# Setting colours
alias less='less --RAW-CONTROL-CHARS'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias pactree='pactree -c'

alias config='git --git-dir=$HOME/.DOTFILES/ --work-tree=$HOME'

# One-liner shortcuts
alias battery='upower -i $(upower -e | grep '/battery') | grep -E "state|\ time|\ full|to\ empty|percentage"'
alias notetemplate='pandoc --toc --number-section'
# Have filename end with .tar.gz preferably
alias archive='tar -czvf'

# PS1='[\u@\h \W]\$ '
PS1='\W \$ '
# PS1='\[\e[00;34m\]λ \W \[\e[0m\]'

# Run neofetch if a display server is not running
# [ -n "$DISPLAY" ] && neofetch

eval "$(starship init bash)"
