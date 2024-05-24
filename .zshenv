#!/bin/zsh
# Path
export PATH="$PATH:$HOME/.local/bin:$HOME/.local/share/nvim/mason/bin"

# Preferences
export VISUAL=nvim
export EDITOR=nvim
export PAGER=bat
export READER=zathura
export BROWSER=firefox

# CPU
export AMD_VULKAN_ICD=RADV
export RANGER_LOAD_DEFAULT_RC=FALSE
export MOZ_DISABLE_RDD_SANDBOX=1

# Graphical
if [ "$XDG_SESSION_TYPE"=="wayland" ]; then
  export MOZ_ENABLE_WAYLAND=1
fi

# Use bat as a colorizing pager for man
export MANPAGER="sh -c 'col -bx | bat -l man -p --color=always'"
export MANROFFOPT="-c"

# fzf settings
export FZF_DEFAULT_COMMAND='fd --type file --hidden --exclude .git'
export FZF_DEFAULT_OPTS="--preview 'bat --style=header-filename,header-filesize -r 40: --color=always {}' --color=dark --scheme=path --keep-right --tiebreak=length,end,begin --filepath-word --border=none --ansi --preview-window=up,20%"

# sockets
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
# export SWAYSOCK=/run/user/$(id -u)/sway-ipc.$(id -u).$(pgrep -x sway).sock

export npm_config_prefix="$HOME/.local"
