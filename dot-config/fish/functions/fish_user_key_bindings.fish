function fish_user_key_bindings
  fish_default_key_bindings -M insert
  fish_vi_key_bindings --no-erase
  bind -M insert -m default jk repaint-mode
end
