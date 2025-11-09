export (envsubst < $HOME/.config/environment.d/env.conf)

set -gx PAGER bat

fish_add_path -g \
  "$XDG_DATA_HOME/nvim/mason/bin" \
  "$XDG_CONFIG_HOME/emacs/bin" \

# Use bat as a colorizing pager for man
set -gx MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
set -gx BAT_STYLE "plain"

# fzf settings
set -gx FZF_DEFAULT_COMMAND "fd --type file --hidden --exclude .git"
set -gx FZF_DEFAULT_OPTS "--preview 'bat --style=header-filename,header-filesize -r 40: --color=always {}' --color=dark --scheme=path --keep-right --tiebreak=length,end,begin --filepath-word --border=none --ansi --preview-window=up,20%"

# For NTFY helper program
set -gx NTFY_TOPIC "ping"
set -gx NTFY_TAGS "$hostname"

# Enable LSP support for nvim config
set -gx NVIM_PROFILE "laptop"
set -gx NVIM_LSP_ENABLED "true"
set -gx NVIM_AUTOFORMAT_ENABLED "true"
