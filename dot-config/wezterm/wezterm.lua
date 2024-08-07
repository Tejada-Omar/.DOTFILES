local wezterm = require('wezterm')
local act = wezterm.action

local config = {
  color_scheme = 'Rosé Pine (Gogh)',
  font = wezterm.font('JetBrains Mono'),
  scrollback_lines = 10000,
  use_fancy_tab_bar = true,
  window_decorations = 'RESIZE',
  font_size = 12.5,
  check_for_updates = false,
  show_new_tab_button_in_tab_bar = false,
  switch_to_last_active_tab_when_closing_tab = true,
  hide_tab_bar_if_only_one_tab = true,
}

config.window_frame = {
  font = wezterm.font { family = 'JetBrains Mono', weight = 'Bold' },
  active_titlebar_bg = '#191724',
  inactive_titlebar_bg = '#191724',
}

config.colors = {
  tab_bar = {
    inactive_tab_edge = '#524f67',
  },
}

config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1500 }

config.keys = {
  { key = 'c', mods = 'LEADER', action = act { SpawnTab = 'CurrentPaneDomain' } },
  { key = '"', mods = 'LEADER|SHIFT', action = act { SplitVertical = { domain = 'CurrentPaneDomain' } } },
  { key = '%', mods = 'LEADER|SHIFT', action = act { SplitHorizontal = { domain = 'CurrentPaneDomain' } } },
  { key = 'o', mods = 'LEADER', action = 'TogglePaneZoomState' },
  { key = 'z', mods = 'LEADER', action = 'TogglePaneZoomState' },
  { key = 'h', mods = 'LEADER', action = act { ActivatePaneDirection = 'Left' } },
  { key = 'j', mods = 'LEADER', action = act { ActivatePaneDirection = 'Down' } },
  { key = 'k', mods = 'LEADER', action = act { ActivatePaneDirection = 'Up' } },
  { key = 'l', mods = 'LEADER', action = act { ActivatePaneDirection = 'Right' } },
  { key = 'H', mods = 'LEADER|SHIFT', action = act { AdjustPaneSize = { 'Left', 5 } } },
  { key = 'J', mods = 'LEADER|SHIFT', action = act { AdjustPaneSize = { 'Down', 5 } } },
  { key = 'K', mods = 'LEADER|SHIFT', action = act { AdjustPaneSize = { 'Up', 5 } } },
  { key = 'L', mods = 'LEADER|SHIFT', action = act { AdjustPaneSize = { 'Right', 5 } } },
  { key = '&', mods = 'LEADER|SHIFT', action = act { CloseCurrentTab = { confirm = true } } },
  { key = 'd', mods = 'LEADER', action = act { CloseCurrentPane = { confirm = true } } },
  { key = 'x', mods = 'LEADER', action = act { CloseCurrentPane = { confirm = true } } },
  { key = '/', mods = 'LEADER', action = act { Search = { CaseSensitiveString = '' } } },
  { key = '[', mods = 'LEADER', action = act('ActivateCopyMode') },
  { key = 'R', mods = 'LEADER|SHIFT', action = act('ReloadConfiguration') },
  { key = '1', mods = 'LEADER', action = act { ActivateTab = 0 } },
  { key = '2', mods = 'LEADER', action = act { ActivateTab = 1 } },
  { key = '3', mods = 'LEADER', action = act { ActivateTab = 2 } },
  { key = '4', mods = 'LEADER', action = act { ActivateTab = 3 } },
  { key = '5', mods = 'LEADER', action = act { ActivateTab = 4 } },
  { key = '6', mods = 'LEADER', action = act { ActivateTab = 5 } },
  { key = '7', mods = 'LEADER', action = act { ActivateTab = 6 } },
  { key = '8', mods = 'LEADER', action = act { ActivateTab = 7 } },
  { key = '9', mods = 'LEADER', action = act { ActivateTab = 8 } },
}

return config
