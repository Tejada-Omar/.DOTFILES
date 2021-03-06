from typing import List  # noqa: F401
from libqtile import bar, layout, widget, extension
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from colors import Colors

mod = "mod4"
mod1 = "mod1"
terminal = guess_terminal()

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
    Key([mod, "control"], "space", lazy.window.toggle_floating()),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "f", lazy.window.toggle_fullscreen()),

    # Qtile controls
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawn("dmenu_run -x 10 -y 10 -z 1900")),

    # Volume controls
    Key([mod], "F10", lazy.spawn("amixer -q set Master toggle")),
    Key([mod], "F11", lazy.spawn("amixer -q set Master 5%-")),
    Key([mod], "F12", lazy.spawn("amixer -q set Master 5%+")),

    # Backlight
    Key([mod], "F1", lazy.spawn("xbacklight -5")),
    Key([mod], "F2", lazy.spawn("xbacklight +5")),

    # Player Manager
    Key([mod], "F7", lazy.spawn("playerctl previous")),
    Key([mod], "F8", lazy.spawn("playerctl play-pause")),
    Key([mod], "F9", lazy.spawn("playerctl next")),

    # Visual
    Key([mod], "F3", lazy.spawn("picom-trans -ct")),
    Key([], "Print", lazy.spawn("scrot '%Y%m%d-%H%M%S.png' -e 'mv $f $$(xdg-user-dir PICTURES)/Screenshots'")),
    Key([mod], "Print", lazy.spawn("scrot -s '%Y%m%d-%H%M%S.png' -e 'mv $f $$(xdg-user-dir PICTURES)/Screenshots'")),
]

groups = [Group(i) for i in '123456789']
for i in groups:
    keys.append(Key([mod], i.name, lazy.group[i.name].toscreen()))
    keys.append(Key([mod, "shift"], i.name, lazy.window.togroup(i.name)))

palette = Colors()

layout_theme = {"border_width": 2,
                "margin": 10,
                "border_focus": "#b2beb5",
                "border_normal": palette.DARK
                }

layouts = [
    layout.Columns(
        **layout_theme,
        border_focus_stack = palette.SECONDARY,
    ),
    # layout.Zoomy(
    #     **layout_theme,
    #     columnwidth = 190
    # ),
    layout.Stack(**layout_theme, num_stacks=1),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(**layout_theme),
    # layout.MonadWide(),
    # layout.Max(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
]

widget_defaults = dict(
    font='Fira Code',
    fontsize=13,
    padding=7,
    foreground = palette.WHITE,
    background = palette.DARK
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top = bar.Bar(
            [
                widget.GroupBox(
                    padding_x = 6,
                    margin_x = 0,
                    borderwidth = 0,
                    active = palette.WHITE,
                    inactive = palette.WHITE,
                    rounded = True,
                    highlight_color = palette.DARK,
                    highlight_method = "block",
                    this_current_screen_border = palette.SECONDARY,
                    block_highlight_text_color = palette.WHITE,
                    hide_unused = True
                ),
                widget.Spacer(),
                widget.WindowName(
                    format = '{name}',
                    width = bar.CALCULATED
                ),
                widget.Spacer(),
                widget.Systray(),
                widget.Battery(
                    format = '{char} {percent:2.0%}',
                    low_percentage = 0.3,
                    low_foreground = '#e15555',
                    padding = 7
                ),
                widget.Volume(
                    cardid = 1,
                    theme_path = '/usr/share/icons/Tela-dark/24/actions/',
                    padding = 0,
                ),
                widget.Clock(
                    format='%m/%d %a %-I:%M %p',
                    padding = 10
                )
            ],
            26,
            margin = [10, 10, 0, 10],
            opacity = 1
        ),
        wallpaper = "~/Pictures/Wallpapers/rocky.jpg",
        wallpaper_mode = "fill",
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    # *layout.Floating.default_float_rules,
    # Match(wm_type='utility'),
    Match(wm_type='notification'),
    Match(wm_type='toolbar'),
    Match(wm_type='splash'),
    Match(wm_type='dialog'),
    Match(wm_class='file_progress'),
    Match(wm_class='confirm'),
    Match(wm_class='dialog'),
    Match(wm_class='download'),
    Match(wm_class='error'),
    Match(wm_class='notification'),
    Match(wm_class='splash'),
    Match(wm_class='toolbar'),
    Match(func=lambda c: c.has_fixed_size()),
    Match(func=lambda c: c.has_fixed_ratio())
])
auto_fullscreen = True
focus_on_window_activation = "smart"

wmname = "qtile"
