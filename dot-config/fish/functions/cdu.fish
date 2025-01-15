function cdu
  if test "/" = (pwd)
    return 0
  end

  set comps
  set n (pwd | rg --count-matches --null-data --include-zero '/')

  if test -n "$argv"; and string match -qrv '\D' -- "$argv"
    if test $argv -gt $n
      return 1
    end

    set sel (pwd | cut -d'/' -f-(math 1 + $n - $argv))
    cd "$sel/"; or return 1
    return 0
  end

  for i in (seq 2 $n)
    set -a comps (pwd | cut -z -d'/' -f-$i)
  end

  set fzf_cmd fzf +m --read0 --preview='eza -l {}' --preview-window=,50%
  set sel (printf '%s\0' $comps | $fzf_cmd)
  if test -n "$sel"
    cd $sel
  end
end
