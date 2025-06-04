function cdd -w __fzf_shortcut
  set _cmd_name (status function)
  argparse (__fzf_shortcut __opts | string split0) -- $argv
  or return

  if set -q _flag_help
    __fzf_shortcut $argv
    return
  end

  set sel (__fzf_shortcut $argv)
  or return

  if test -z "$sel"
    return 1
  else if test -d "$sel"
    cd $sel
  else if test -f "$sel"
    cd (dirname $sel)
  end
end
