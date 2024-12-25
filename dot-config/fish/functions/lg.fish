function lg -w lazygit
  set -x LAZYGIT_NEW_DIR_FILE $XDG_CONFIG_HOME/lazygit/newdir
  lazygit $argv

  if test -f $LAZYGIT_NEW_DIR_FILE
    cd (cat $LAZYGIT_NEW_DIR_FILE)
    rm -f $LAZYGIT_NEW_DIR_FILE > /dev/null
  end
end
