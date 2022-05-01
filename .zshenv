#!/bin/zsh
# Preferences
export EDITOR=nvim
export PAGER=bat
export READER=zathura

# CPU
export AMD_VULKAN_ICD=RADV
export RANGER_LOAD_DEFAULT_RC=FALSE

# Use bat as a colorizing pager for man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Use fd as backend for fzf
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git --color=always'
