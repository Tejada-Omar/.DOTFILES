function __fzf_shortcut_help -V _cmd_name
  # Use $_cmd_name to allow overriding the name by wrappers
  echo "USAGE: $_cmd_name [options...] [paths...]"
  echo 'OPTIONS:'
  set -l options '-h, --help' 'print this help information' \
    '-t, --type' 'may be one of [f, d]' \
    '-i, --noignore' 'disable interpretation of .cddignore' \
    '-r, --relative' 'resolve paths resolve to passed dir [default: cwd]' \
    'paths...' 'paths to include in the search query'

  for i in (seq 1 2 (count $options))
    set -l option $options[$i]
    set -l desc $options[(math $i + 1)]
    printf '\t%s \033[33m%s\033[0m\n' "$option" "$desc"
  end
end

function __fzf_shortcut -S
  set -l __opts \
    't/type=!test "$_flag_value" = "f" -o "$_flag_value" = "d"' \
    'r/relative=?!test -z "$_flag_value" -o -d "$_flag_value"' \
    'i/noignore' 'h/help'

  # Avoid using argparse for same reason this is undocumented
  # Ability to use this arg should not bubble to wrapping callers
  if test "$argv[1]" = '__opts'
    string join0 $__opts
    return
  end

  argparse $__opts -- $argv
  or return

  if set -q _flag_help
    set -q _cmd_name
    or set _cmd_name (status function)

    __fzf_shortcut_help
    return
  end

  if set -q _flag_relative && test -z "$_flag_relative"
    set _flag_relative '.'
  end

  # Only include arguments in non-empty, otherwise use home dir
  if string trim $argv | string length -q
    set paths $argv
  else
    set paths ~
  end

  # Resolve each symlink in paths and get the directory component
  for i in (seq (count $paths))
    set -l realpath_cmd "realpath -e \"$paths[$i]\""
    set -q _flag_relative
    and set -a realpath_cmd "--relative-base=$_flag_relative"

    set paths[$i] (eval $realpath_cmd)
    or return 1

    # NOOP if the path is already a directory
    test ! -f "$paths[$i]" && continue
    set paths[$i] (dirname "$paths[$i]")
  end

  set -q _flag_type
  or set _flag_type d

  # Base fd command
  set fd_cmd fd --print0 -H -L -E 'node_modules' -E "'.git*'" --no-require-git -tl

  set -q _flag_i
  or set -a fd_cmd --ignore-file ~/.cddignore

  # Base fzf command
  set fzf_cmd fzf +m --read0 --scheme=path --filepath-word -d '/' --preview-window=up,20% --header "$paths"

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

  set _fd_cmd $fd_cmd .
  set -a fd_cmd . $paths # Append search terms at the end for easier debugging

  set binds "load:bell"
  set -a binds "tab:transform:set -l __tmp (test -d {} && echo -- {} || echo -- {..-2}); echo -- \"reload<$_fd_cmd \$__tmp>+change-header<\$__tmp>\""
  set -a binds "ctrl-space:transform:set -l __tmp (test -d {} && echo -- {..-4} || echo -- {..-3}); echo -- \"reload<$_fd_cmd \$__tmp>+change-header<\$__tmp>\""
  set -a binds "shift-tab:reload<$fd_cmd>+change-header<$paths>"

  for bind in $binds
    set -a fzf_cmd --bind $bind
  end

  $fd_cmd | $fzf_cmd
end
