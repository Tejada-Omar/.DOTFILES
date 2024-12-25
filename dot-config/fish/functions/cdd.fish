function cdd
  if ! argparse \
    't/type=!test "$_flag_value" = "f" -o "$_flag_value" = "d"' \
    'i/noignore' 'h/help' \
    -- $argv

    echo "Invalid arguments passed"
    return 1
  end

  if set -q _flag_help
    echo 'USAGE: cdd [-hi] [-t type] [paths...]'
    echo 'OPTIONS:'
    set -l options '-h, --help' 'print this help information' \
      '-t, --type' 'may be one of [f, d]' \
      '-i' 'disable interpretation of .cddignore' \
      'paths...' 'paths to include in the search query'

    for i in (seq 1 2 (count $options))
      set -l option $options[$i]
      set -l desc $options[(math $i + 1)]
      printf '\t%s \033[33m%s\033[0m\n' "$option" "$desc"
    end

    return 0
  end

  # Only include arguments in non-empty, otherwise use home dir
  if string trim $argv | string length -q
    set paths $argv
  else
    set paths ~
  end

  # Resolve each symlink in paths and get the directory component
  for i in (seq (count $paths))
    if ! set paths[$i] (realpath -e "$paths[$i]")
      return 1
    end

    # NOOP if the path is already a directory
    test ! -f "$paths[$i]" && continue
    set paths[$i] (dirname "$paths[$i]")
  end

  set -q _flag_type
  or set _flag_type d

  # Base fd command
  set fd_cmd fd --print0 -H -L -E 'node_modules' -E '.git*' --no-require-git -tl

  set -q _flag_i
  or set -a fd_cmd --ignore-file ~/.cddignore

  # Base fzf command
  set fzf_cmd fzf +m --read0 --tiebreak=length,begin --preview-window=up,20%

  switch $_flag_type
  case f
    set -a fzf_cmd --preview='bat --style=header-filename,header-filesize -r 40: --color=always {}'
    set -a fd_cmd -tf
  case d
    set -a fzf_cmd --preview='eza -lF --no-permissions {}'
    set -a fd_cmd -td
  case '*'
    echo "Invalid argument passed to --type"
    return 1
  end

  # Append search terms at the end for easier debugging
  set -a fd_cmd . $paths

  set sel ($fd_cmd | $fzf_cmd)
  if test -n "$sel"
    cd $sel
  end
end
