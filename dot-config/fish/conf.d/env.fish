export (envsubst < $HOME/.config/environment.d/env.conf)

set -gx PAGER bat -p
set -gx READER "zathura"
set -gx BROWSER "firefox"
set -gx GOPATH "$HOME/go"

fish_add_path -g \
  "$HOME/.local/bin" \
  "$XDG_DATA_HOME/nvim/mason/bin" \
  "$XDG_CONFIG_HOME/emacs/bin" \
  "$GOPATH/bin" \
  "$HOME/.cargo/bin"

# Use bat as a colorizing pager for man
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p --color=always --wrap never'"
set -gx MANROFFOPT "-c"

# fzf settings
set -gx FZF_DEFAULT_COMMAND "fd --type file --hidden --exclude .git"
set -gx FZF_DEFAULT_OPTS "--preview 'bat --style=header-filename,header-filesize -r 40: --color=always {}' --color=dark --scheme=path --keep-right --tiebreak=length,end,begin --filepath-word --border=none --ansi --preview-window=up,20%"

# For NTFY helper program
set -gx NTFY_TOPIC "ping"
set -gx NTFY_TAGS "$hostname"

# Enable LSP support for nvim config
set -gx NVIM_LSP_ENABLED "true"
