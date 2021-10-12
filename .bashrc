#!/bin/bash
export EDITOR=nvim
export PAGER=bat
export READER=zathura

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export RANGER_LOAD_DEFAULT_RC=FALSE

# Use bat as a colorizing pager for man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Dotfiles management
alias config='git --git-dir=$HOME/.DOTFILES/ --work-tree=$HOME'

# One-liner shortcuts
alias battery='upower -i $(upower -e | grep '/battery') | grep -E "state|\ time|\ full|to\ empty|percentage"'
alias notetemplate='pandoc --toc --number-section -V geometry:margin=2cm -V fontsize=12pt'
alias archive='tar -czvf'
alias cdf='cd $(fd -H -t f . '/home/omar' | fzf | xargs dirname)'
alias cdd='cd $(fd -H -t d . '/home/omar' | fzf)'
alias reflectorupdate='reflector --latest 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist'

PS1='\W \$ '
PROMPT_COMMAND='echo -ne "\033]0;$(history | tail -n1 | cut -c 8-)\007"'

eval "$(starship init bash)"
