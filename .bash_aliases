#!/bin/bash
# Dotfiles management
alias config='git --git-dir=$HOME/.DOTFILES/ --work-tree=$HOME'

# Redirect to better commands
alias ls='exa'

# Command shortcuts
alias pa='pacman'
alias pac='sudo pacman'
alias sy='systemctl'
alias sys='sudo systemctl'

# One-liner shortcuts
alias battery='upower -i $(upower -e | grep '/battery') | grep -E "state|\ time|\ full|to\ empty|percentage"'
alias notetemplate='pandoc --toc --number-section -V geometry:margin=2cm -V fontsize=12pt'
alias archive='tar -czvf'
alias cdf='cd $(fd -H -t f . '/home/omar' | fzf | xargs dirname)'
alias cdd='cd $(fd -H -t d . '/home/omar' | fzf)'
alias reflectorupdate='reflector --latest 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist'
