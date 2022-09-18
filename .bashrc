#!/bin/bash
export EDITOR=nvim
export PAGER=bat
export READER=zathura

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export AMD_VULKAN_ICD=RADV
export RANGER_LOAD_DEFAULT_RC=FALSE

# Use bat as a colorizing pager for man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Use fd as backend for fzf
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'

PS1='\W \$ '
PROMPT_COMMAND='echo -ne "\033]0;$(history | tail -n1 | cut -c 8-)\007"'

echo "In Bash"

source ~/.bash_aliases
