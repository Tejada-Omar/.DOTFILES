-- Hide tmux keybinds from the hotkeys popup
package.loaded['awful.hotkeys_popup.keys.tmux'] = {}

-- Standard awesome library
local gears = require('gears')
local awful = require('awful')
require('awful.autofocus')

-- Widget and layout library
local wibox=require("wibox")

-- Theme handling library
local beautiful = require('beautiful')
local keys = require('keys')

-- Loading the theme
theme_path = string.format('%s/.config/awesome/themes/%s/theme.lua', os.getenv('HOME'), 'Morning')
beautiful.init(theme_path)

-- Set the wallpaper
local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == 'function' then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal('property::geometry', set_wallpaper)

for s = 1, screen.count() do
	gears.wallpaper.maximized(beautiful.wallpaper, s, true)
end

-- Layouts
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.fair,
    awful.layout.suit.corner.nw,
    awful.layout.suit.max,
    -- awful.layout.suit.floating,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}

local battery_bar = wibox.widget {
    min_value = 0,
    max_value = 100,
    value = 0,
    margins = {
        top    = 8.1,
        bottom = 8.1,
    },
    forced_width = 32,
    border_width = 1.7,
    color        = beautiful.fg_normal,
    border_color = beautiful.fg_normal,
    background_color = gears.color.parse_color('#00ffffff'),
    widget = wibox.widget.progressbar,
}

local updating_textbox = wibox.widget {
    text = "should not be here",
    widget = wibox.widget.textbox
}

local volume = wibox.widget {
    text = "should not be here",
    widget = wibox.widget.textbox
}

-- For updating the battery bar
gears.timer {
    timeout = 60,
    call_now = true,
    autostart = true,
    callback = function()
        -- Should be done by reading from /sys/class/power_supply/ according to
        -- the documentation but I can't find the relative documentation for
        -- opening a async io channel
        awful.spawn.easy_async_with_shell(
            "upower -i $(upower -e | grep '/battery') | grep percentage|xargs|cut -d' ' -f2 | sed s/%//",
            function(stdout, stderr, exitreason, exitcode)
                battery_bar.value = tonumber(stdout)
            end
        )
    end
}

gears.timer {
    timeout = 20,
    call_now = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async_with_shell(
            "upower -i $(upower -e | grep '/battery') | grep state | sed s/state://",
            function(stdout, stderr, exitreason, exitcode)
                updating_textbox.text = string.match(stdout, '[a-z]+')
            end
        )
    end
}

gears.timer {
    timeout = 1,
    call_now = true,
    autostart = true,
    callback = function()
        awful.spawn.easy_async_with_shell(
            "awk -F\"[][]\" '/Left:/ { print $4 \", \" $2 }' <(amixer sget Master)",
            -- amixer sget Master | grep Left: | cut -d ' ' -f8
            function(stdout, stderr, exitreason, exitcode)
                volume.text = stdout
            end
        )
    end
}

awful.screen.connect_for_each_screen(function(s)
    --[[ Uncomment this if not using custom tag names (no. of tags will be derived from `tags` variable set in keys.lua)
    -- Also uncomment `keys.tags = tags` line in the Variables section in keys.lua!
    local tagTable = {}
    for i = 1, keys.tags do
        table.insert(tagTable, tostring(i))
    end
    ]]
    
    awful.tag({'1', '2', '3', '4', '5'}, s, awful.layout.layouts[1])

    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
        awful.button({ }, 1, function() awful.layout.inc(1) end),
        awful.button({ }, 3, function() awful.layout.inc(-1) end),
        awful.button({ }, 4, function() awful.layout.inc(1) end),
        awful.button({ }, 5, function() awful.layout.inc(-1) end)))

    s.mypromptbox = awful.widget.prompt()

    -- Create a tasklist widget
    s.mytaglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s } )

    -- Add widgets to the wibox
    local margin = 9
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            wibox.container.margin(s.mypromptbox, margin, margin),
        },
        { -- Middle widgets
            layout = wibox.layout.flex.horizontal,
        },
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            spacing_widget = wibox.widget {
                widget = wibox.widget.separator,
                thickness = 2,
                span_ratio = 0.45
            },
            spacing = 2,
            {
                wibox.container.margin(battery_bar, margin, margin),
                wibox.container.margin(updating_textbox, 2, margin),
                layout = wibox.layout.fixed.horizontal
            },
            {
                wibox.container.margin(volume, margin, margin - 1),
                wibox.container.margin(wibox.widget.textbox("volume"), 0, margin), 
                layout = wibox.layout.fixed.horizontal
            },
            -- Example: "23:42 on Monday, May 24"
            wibox.container.margin(wibox.widget.textclock('%H:%M on %A, %B %d'), margin, margin),
            wibox.container.margin(s.mylayoutbox, margin, margin),
        },
    }
end)

awful.rules.rules = {
    -- All windows
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = keys.clientkeys,
                     buttons = keys.clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
                   }
    },
        
    -- Floating exceptions
    { rule_any = {
            class = {'Lxappearance', 'qt5ct'},
            name = {'Event Tester'}, --xev
            role = {'pop-up', 'GtkFileChooserDialog'},
            type = {'dialog'}
        },
        properties = {floating = true}
    },
    -- Don't put border color on polybar
    { rule_any = {
            class = {'Polybar'}
        },
        properties = {border_color = nil}
    }
}

-- Enable sloppy focus
client.connect_signal('mouse::enter', function(c)
    c:emit_signal('request::activate', 'mouse_enter', {raise = false})
end)

-- Colored borders
client.connect_signal('focus', function(c) c.border_color = beautiful.border_focus end)
client.connect_signal('unfocus', function(c) c.border_color = beautiful.border_normal end)
