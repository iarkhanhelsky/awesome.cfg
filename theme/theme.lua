--[[

     Multicolor Awesome WM theme 2.0
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")

local os = { getenv = os.getenv, setlocale = os.setlocale }
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility


-- Basic fonts
local fonts = {
    mono = 'Monospace Bold 8',
    primary = 'Roboto Bold 10',
    secondary = 'Roboto 9',
    iconic = 'Font Awesome Free'
}

local palette = {
    bg_primary =      '#1c1a1e',
    bg_secondary =    '#1a191c',

    fg_primary =      '#ffffff',
    fg_secondary =    '#3f3f3f',

    fg_urgent = '',
    bg_urgent = ''
}

local theme                                     = {}
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/theme"
theme.wallpaper                                 = theme.confdir .. "/wall.png"
theme.font                                      = "Roboto Bold 9"
theme.menu_bg_normal                            = "#1c1a1e"
theme.menu_bg_focus                             = "#1c1a1e"
theme.bg_normal                                 = "#1c1a1e"
theme.bg_focus                                  = "#1c1a1e"
theme.bg_urgent                                 = "#1c1a1e"
theme.fg_normal                                 = "#3f3f3f"
theme.fg_focus                                  = "#ffffff"
theme.fg_urgent                                 = "#af1d18"
theme.fg_minimize                               = "#ffffff"
theme.border_width                              = 4
theme.border_normal                             = "#1c1a1e"
theme.border_focus                              = "#1c2022"
theme.border_marked                             = "#3ca4d8"
theme.menu_border_width                         = 0
theme.menu_width                                = 130
theme.menu_submenu_icon                         = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal                            = "#aaaaaa"
theme.menu_fg_focus                             = "#ff8c00"
theme.menu_bg_normal                            = "#050505dd"
theme.menu_bg_focus                             = "#050505dd"
theme.widget_temp                               = theme.confdir .. "/icons/temp.png"
theme.widget_uptime                             = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                                = theme.confdir .. "/icons/cpu.png"
theme.widget_weather                            = theme.confdir .. "/icons/dish.png"
theme.widget_fs                                 = theme.confdir .. "/icons/fs.png"
theme.widget_mem                                = theme.confdir .. "/icons/mem.png"
theme.widget_note                               = theme.confdir .. "/icons/note.png"
theme.widget_note_on                            = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown                            = theme.confdir .. "/icons/net_down.png"
theme.widget_netup                              = theme.confdir .. "/icons/net_up.png"
theme.widget_mail                               = theme.confdir .. "/icons/mail.png"
theme.widget_batt                               = theme.confdir .. "/icons/bat.png"
theme.widget_clock                              = theme.confdir .. "/icons/clock.png"
theme.widget_vol                                = theme.confdir .. "/icons/spkr.png"
theme.taglist_squares_sel                       = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel                     = theme.confdir .. "/icons/square_b.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = false
theme.useless_gap                               = 4
theme.layout_tile                               = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps                           = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft                           = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                                = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.confdir .. "/icons/floating.png"
theme.titlebar_close_button_normal              = theme.confdir .. "/icons/close.png"
theme.titlebar_close_button_focus               = theme.confdir .. "/icons/close.png"
theme.titlebar_minimize_button_normal           = theme.confdir .. "/icons/minimise.png"
theme.titlebar_minimize_button_focus            = theme.confdir .. "/icons/minimise.png"
theme.titlebar_ontop_button_normal_inactive     = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.confdir .. "/icons/minimise.png"
theme.titlebar_floating_button_focus_inactive   = theme.confdir .. "/icons/minimise.png"
theme.titlebar_floating_button_normal_active    = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/maximise.png"
theme.titlebar_maximized_button_focus_inactive  = theme.confdir .. "/icons/maximise.png"
theme.titlebar_maximized_button_normal_active   = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"

local markup = lain.util.markup

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local mytextclock = wibox.widget.textclock(markup.font("Roboto Bold 8", markup("#ffffff", " %H:%M ")))

-- Calendar
theme.cal = lain.widget.calendar({
    attach_to = { mytextclock },
    notification_preset = {
        font = fonts.mono,
        fg   = theme.fg_focus,
        bg   = theme.bg_normal
    }
})

-- / fs
local fsicon = wibox.widget.imagebox(theme.widget_fs)
theme.fs = lain.widget.fs({
    notification_preset = { font = fonts.mono, fg = theme.fg_focus },
    settings  = function()
        widget:set_markup(markup.fontfg(theme.font, theme.fg_focus, string.format("%.1f", fs_now["/"].used) .. "% "))
    end
})

-- Battery
local bolt = ''
local batlevels = {
    '',   -- empty
    '',   -- 1/4
    '',   -- 1/2
    '',   -- 3/4
    ''    -- full
}

local bat = lain.widget.bat({
    settings = function()
        local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "%" or bat_now.perc
        perc = markup.font("Roboto Bold 8", perc)

        if bat_now.ac_status == 1 then
            perc = markup.fontfg(fonts.iconic .. ' 9', '#ffffff', bolt) .. ' ' .. perc
        end

        local baticon = batlevels[5]

        if bat_now.perc ~= 'N/A' and bat_now.perc then
           baticon = batlevels[math.floor(bat_now.perc / 100.0 * 4) + 1]
        end

        perc = perc .. ' ' .. markup.fontfg(fonts.iconic .. ' 9', '#ffffff', baticon)

        widget:set_markup(markup.fontfg(theme.font, theme.fg_focus, '  ' .. perc .. ' '))
    end
})


-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volume_now.level = volume_now.level .. "M"
        end
        -- local vol_icon =  markup.fontfg(font.iconic .. ' 9', '#cccccc', ' ')
        widget:set_markup(markup.fontfg("Roboto Bold 8", "#cccccc", " " .. volume_now.level .. "%  "))
    end
})

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[2])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 45, bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            --s.mylayoutbox,
            s.mytaglist,
            s.mypromptbox
        },
        --s.mytasklist, -- Middle widget
        nil,
        {
            layout = wibox.container.margin,
            top = 6,
            bottom = 6,
            right = 20,
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                wibox.widget.systray(),

                theme.volume.widget,
                bat.widget,
                mytextclock,
                s.mylayoutbox
            },
        }
    }

    -- Create the bottom wibox
    s.mybottomwibox = awful.wibar({ position = "bottom", screen = s, border_width = 0, height = 30, bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the bottom wibox
    s.mybottomwibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
        },
        s.mytasklist -- Middle widget
    }
end

return theme
