function fish_user_key_bindings
  # Standard binds
  fish_default_key_bindings -M insert
  fish_vi_key_bindings --no-erase
  bind -M insert -m default jk repaint-mode

  # Fzf shortcuts
  bind -M insert alt-f 'commandline -i (__fzf_shortcut -tf -r .)'
  bind -M insert alt-shift-f 'commandline -i (__fzf_shortcut -tf -i -r .)'
  bind -M insert alt-d 'commandline -i (__fzf_shortcut -td -r .)'
  bind -M insert alt-shift-d 'commandline -i (__fzf_shortcut -td -i -r .)'
end
