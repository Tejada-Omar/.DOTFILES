#!/bin/bash
# Dotfiles management
alias config='git --git-dir=$HOME/.DOTFILES/ --work-tree=$HOME'

# Redirect to better commands
alias ls='exa'

# Command shortcuts
alias n='nvim'
alias p='pacman'
alias pa='sudo pacman'
alias s='systemctl'
alias sy='sudo systemctl'
alias z='zathura --fork'
alias f="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias open='xdg-open'

# One-liner shortcuts
alias battery='upower -i $(upower -e | grep '/battery') | grep -E "state|\ time|\ full|to\ empty|percentage"'
alias notetemplate='pandoc --toc --number-section -V geometry:margin=2cm -V fontsize=12pt'
alias archive='tar -czvf'
alias cdf='cd $(fd -H -t f . '/home/omar' | fzf | xargs dirname)'
alias cdd='cd $(fd -H -t d . '/home/omar' | fzf)'
alias reflectorupdate='reflector --latest 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist'
alias onew='alacritty --working-directory $(pwd) &'
alias keychron='sudo systemctl start keychron'

# Functions for positional arguments
startnotes() {
  head -n 5 "$1/notes.md" > ./notes.md
}
wcnopythondocs() {
  sed 's/^[ \t]*//g' "$1" | rg -v '^#' | wc -l
}
