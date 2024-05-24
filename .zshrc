# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _match _approximate _prefix
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 4 numeric
zstyle ':completion:*' menu select=5
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle :compinstall filename '/home/omar/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Vim-mode
bindkey -v
export KEYTIMEOUT=10
bindkey -M viins 'jk' vi-cmd-mode

# Automatically rehash with pacman hook
zshcache_time="$(date +%s%N)"
autoload -Uz add-zsh-hook
rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}
add-zsh-hook -Uz precmd rehash_precmd

# Set search starting at cursor on up/down key when typing command
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# Change window title based on last command
change_window_title() {echo -ne "\033]0;$(history | tail -n1 | cut -c 8-)\007";}
add-zsh-hook precmd change_window_title

# if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
#   tmux attach || tmux >/dev/null 2>&1
# fi

#compdef wampy
###-begin-wampy-completions-###
#
# yargs command completion script
#
# Installation: /home/omar/.local/bin/wampy completion >> ~/.zshrc
#    or /home/omar/.local/bin/wampy completion >> ~/.zprofile on OSX.
#
_wampy_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" /home/omar/.local/bin/wampy --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _wampy_yargs_completions wampy
###-end-wampy-completions-###

# Starship prompt
eval "$(starship init zsh)"

source ~/.zshaliases
source ~/.zshfunctions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
