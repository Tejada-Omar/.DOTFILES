#!/bin/zsh
# Preferences
export EDITOR=nvim
export PAGER=bat
export READER=zathura
export BROWSER=firefox
export MANGOHUD=1

# CPU
export AMD_VULKAN_ICD=RADV
export RANGER_LOAD_DEFAULT_RC=FALSE
export MOZ_DISABLE_RDD_SANDBOX=1

# Use bat as a colorizing pager for man
export MANPAGER="sh -c 'col -bx | bat -l man -p --color=always'"

# fzf settings
export FZF_DEFAULT_COMMAND='fd --type file --hidden --exclude .git'
export FZF_DEFAULT_OPTS="--preview 'bat --style=header-filename,header-filesize -r 40: --color=always {}'"
