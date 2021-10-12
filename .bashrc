#!/bin/bash
export EDITOR=nvim
export PAGER=bat
export READER=zathura

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export RANGER_LOAD_DEFAULT_RC=FALSE

# Use bat as a colorizing pager for man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

PS1='\W \$ '
PROMPT_COMMAND='echo -ne "\033]0;$(history | tail -n1 | cut -c 8-)\007"'

eval "$(starship init bash)"

source ~/.bash_aliases
