#!/usr/bin/env fish
set -g fish_greeting

function fish_title
  set -q argv[1]; or set argv fish
  echo (prompt_pwd -d 1): $argv;
end

if status is-interactive
    # Basic aliases
    abbr -a ls eza
    abbr -a la eza -a
    abbr -a n nvim
    abbr -a p pacman
    abbr -a pa sudo pacman
    abbr -a s systemctl
    abbr -a sy sudo systemctl
    abbr -a su systemctl --user
    abbr -a z zathura --fork
    abbr -a g git
    abbr -a gs git status
    abbr -a ga git add
    abbr -a gc git commit
    abbr -a gl git lg
    abbr -a gd git diff
    abbr -a t tmux
    abbr -a ta tmux attach-session
    abbr -a tl tmux list-sessions
    abbr -a tn tmux new-session
    abbr -a tk tmux kill-session
    abbr -a news newsboat
    abbr -a bel echo -e '\\a'

    alias battery='upower -i $(upower -e | grep '/battery') | grep -E "state| time| full| to| empty|precentage"'
    alias reflectorupdate='sudo reflector -c CA,US --age 12 --fastest 20 --sort rate --protocol https,http --save /etc/pacman.d/mirrorlist'
    alias clipqrcode='wl-paste | qrencode -t ansiutf8'
    alias browse-pacman="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
    alias browse-pacman-online="pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse"
    alias temp='cd $(mktemp -d)'
    alias update-grub='sudo grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB'
    alias color-picker='grim -g "$(slurp -p)" -t ppm - | convert - -format "%[pixel:p{0,0}]" txt:-'

    alias webs='websocat --close-status-code 1000 -E'

    # Tex package manager
    alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

    # cd shortcuts
    alias cdt='cd (tmux display-message -p "#{session_path}")'

    if command -q rfc
      abbr rfc PAGER="'nvim -R'" rfc
    end
end
