from typing import List  # noqa: F401

from libqtile import bar, layout, widget, extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
mod1 = "mod1"
terminal = guess_terminal()

colors = [["#2e3440", "#2e3440"],
          ["#4c556a", "#4c556a"],
          ["#85E3FF", "#85E3FF"],
          ["#434c5e", "#434c5e"],
          ["#3b4252", "#3b4252"],
          ["#85E3FF", "#85E3FF"],
          ["#6EB5FF", "#6EB5FF"],
          ["#eceff4", "#eceff4"],
          ["#d8dee9", "#d8dee9"]]

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod1], "Tab", lazy.layout.next(),
        desc="Move window focus to other window"),
    Key([mod1, "shift"], "Tab", lazy.layout.previous()),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift", "control"], "h", lazy.layout.swap_column_left()),
    Key([mod, "shift", "control"], "l", lazy.layout.swap_column_right()),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod], "Tab", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    # Qtile controls
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawn("dmenu_run")),

    # Volume controls
    Key([mod], "F1", lazy.spawn("amixer -q -c 1 set Master toggle")),
    Key([mod], "F2", lazy.spawn("amixer -q -c 1 set Master 5%-")),
    Key([mod], "F3", lazy.spawn("amixer -q -c 1 set Master 5%+")),

    # Backlight
    Key([mod], "F4", lazy.spawn("xbacklight -5")),
    Key([mod], "F5", lazy.spawn("xbacklight +5")),

    # Player Manager
    Key([mod], "F6", lazy.spawn("playerctl previous")),
    Key([mod], "F7", lazy.spawn("playerctl play-pause")),
    Key([mod], "F8", lazy.spawn("playerctl next")),

    # Run Shortcuts
    Key([mod, "shift"], "e", lazy.spawn("EditConfig.sh")),
]

group_names = ["WWW", "CODE", "SYS", "DOC", "CHAT", "MUS", "VID", "MISC"]
groups = [Group(name) for name in group_names]
for i, name in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))

layout_theme = {"border_width": 3,
                "margin": 8,
                "border_focus": "#85E3FF",
                "border_normal": "#3b4252"
                }

layouts = [
    layout.Columns(
        **layout_theme,
        border_focus_stack = "#e15555",
        border_normal_stack = "#3b4252",
        border_on_single = True
    ),
    layout.Max(**layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(**layout_theme),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='JetBrains Mono Bold',
    fontsize=13,
    padding=8,
    background = colors[2]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top = bar.Bar(
            [
                widget.Spacer(8, background = colors[0]),
                widget.GroupBox(
                    margin_y = 4,
                    margin_x = 0,
                    padding_y = 5,
                    padding_x = 12,
                    borderwidth = 3,
                    active = colors[2],
                    inactive = colors[7],
                    rounded = False,
                    highlight_color = colors[3],
                    highlight_method = "line",
                    this_current_screen_border = colors[2],
                    this_screen_border = colors[2],
                    foreground = colors[2],
                    background = colors[0]
                ),
                widget.Sep(linewidth = 0, padding = 6, background = colors[0]),
                widget.Sep(linewidth = 0, padding = 6, background = colors[4]),
                widget.WindowName(background = colors[4], foreground = colors[2]),
                widget.Chord(
                    chords_colors={
                        'launch': ("#5e81ac", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Sep(linewidth = 0, padding = 6, foreground = colors[2], background = colors[4]),
                widget.Systray(padding = 6, foreground = colors[2], background = colors[4]),
                widget.Spacer(8, background = colors[4]),
                widget.Sep(linewidth = 0, padding = 12, foreground = colors[2], background = colors[0]),
                widget.TextBox(
                    text = "Wifi: ",
                    padding = 0,
                    foreground = colors[2],
                    background = colors[0]
                ),
                widget.Wlan(
                    update_interval = "5",
                    format = "{essid} ",
                    background = colors[0],
                    padding = 0
                ),
                widget.Sep(linewidth = 0, padding = 6, background = colors[0]),
                widget.TextBox(
                    text = "Volume:",
                    padding = 0,
                    foreground = colors[2],
                    background = colors[0],
                ),
                widget.Volume(
                    cardid = 1,
                    padding = 6,
                    background = colors[0]
                ),
                widget.Sep(linewidth = 0, padding = 6, background = colors [0]),
                widget.TextBox(
                    text = "Battery:",
                    foreground = colors[2],
                    padding = 0,
                    background = colors[0]
                ),
                widget.Battery(
                    format = "{char} {percent:2.0%}",
                    low_percentage = 0.3,
                    low_foreground = "e15555",
                    background = colors[0]
                ),
                widget.Sep(linewidth = 0, padding = 6, foreground = colors[2], background = colors [0]),
                widget.Sep(linewidth = 0, padding = 3, foreground = colors[2], background = colors [2]),
                widget.Clock(
                    format='%A %B %d %I:%M %p',
                    foreground = colors[0],
                    background = colors[2]
                )
            ],
            24,
        ),
        wallpaper = "~/Pictures/Wallpapers/Ponyo.jpg",
        wallpaper_mode = "fill",
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

wmname = "QTile"
