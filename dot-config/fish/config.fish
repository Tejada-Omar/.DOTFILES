#!/usr/bin/env fish
set -g fish_greeting

function fish_title
  set -q argv[1]; or set argv fish
  echo (prompt_pwd -d 1): $argv;
end

function fish_right_prompt
  if [ $status != 0 ]
    return 0
  end

  task +READY export | jq -r 'max_by(.urgency) | "\(.urgency): \(.description)"'
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
    abbr -a open xdg-open
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
    abbr -a u sudo ufw
    abbr -a todo todoist-cli
    abbr -a news newsboat

    alias battery='upower -i $(upower -e | grep '/battery') | grep -E "state|\time|\ full|to| empty|precentage"'
    alias reflectorupdate='sudo reflector -c CA,US --age 12 --fastest 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist'
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
    alias update-cdd='fd -Ha -td -d1 -E "\.config" -E "\.DOTFILES" "^\." ~ > ~/.cddignore'
    alias cdd='cd "$(fd -H -td --ignore-file ~/.cddignore . ~ | fzf --preview "exa -lF --no-permissions {}" --tiebreak=length,end,begin --preview-window=up,20%)"'
    alias cdda='cd "$(fd -H -td . ~ /etc | fzf --preview "exa -lF --no-permissions {}" --tiebreak=length,end,begin --preview-window=up,20%)"'
    alias cdf='cd "$(fd -H -tf --ignore-file ~/.cddignore . ~ | fzf --preview "bat --style=header-filename,header-filesize -r 40: --color=always {}" --tiebreak=length,end,begin --preview-window=up,20% | xargs dirname)"'
    alias cdfa='cd "$(fd -H -tf . ~ /etc | fzf --preview "bat --style=header-filename,header-filesize -r 40: --color=always {}" --tiebreak=length,end,begin --preview-window=up,20% | xargs dirname)"'
    alias cddh='cd "$(fd -H -td -E .git . | fzf --preview "exa -lF --no-permissions {}" --tiebreak=length,end,begin --preview-window=up,20%)"'
    alias cdt='cd $(tmux display-message -p "#{session_path}")'
end
