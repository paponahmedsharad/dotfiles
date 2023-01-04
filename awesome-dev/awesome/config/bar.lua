--────────────────────────────────────────────────────────────────────
--░░░░░░░░░░░░░░░░░░░░░░░░░░ WIBAR CONFIG ░░░░░░░░░░░░░░░░░░░░░░░░░░░░
--──────────────────────────────𝕾𝖍𝖆𝖗𝖆𝖉────────────────────────────────
local lain = require("lain")
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local watch = require('awful.widget.watch')
local helpers = require("config.helpers")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local todo_widget = require("widgets.todo-widget.todo") --> Todo widget
local bookmark_widget = require("widgets.bookmark-widget.bookmark") --> Bookmark_widget
local powermenu = require("widgets.bookmark-widget.powermenu") --> Bookmark_widget
local batteryarc_widget = require("widgets.batteryarc-widget.batteryarc") --> Battery_widget
-- local network = require("components.bar.network")
-- local battery_widget = require("widgets.battery-widget.battery") --> Battery_widget (not used)



--────────────────────────────────────────────────────────────────────
--░░░░░░░░░░░░░░░░░░░░░░░░░░░░ tagnames ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
--────────────────────────────────────────────────────────────────────
awful.util.tagnames = { "●", "●", "●", "●", "●", "●", "●" }
-- awful.util.tagnames = { "","", "", "", "", "", ""}
-- awful.util.tagnames = { "", "󰮯", "󰮯", "󰮯", "󰮯", "󰮯", "󰮯"}



--────────────────────────────────────────────────────────────────────
--░░░░░░░░░░░░░░░░░░░░░░░░ widget container ░░░░░░░░░░░░░░░░░░░░░░░░░░
--────────────────────────────────────────────────────────────────────
local function barcontainer(widget)
  local container = wibox.widget
  {
    widget,
    top = dpi(1),
    bottom = dpi(1),
    left = dpi(8),
    right = dpi(8),
    widget = wibox.container.margin()
  }
  local box = wibox.widget {
    {
      container,
      top = dpi(4),
      bottom = dpi(4),
      left = dpi(8),
      right = dpi(6),
      widget = wibox.container.margin
    },
    bg = colors.black,
    shape = helpers.rrect(dpi(12)),
    widget = wibox.container.background
  }
  return wibox.widget {
    box,
    top = dpi(6),
    bottom = dpi(6),
    right = dpi(10),
    left = dpi(10),
    widget = wibox.container.margin
  }
end

--────────────────────────────────────────────────────────────────────
--░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ widgets ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
--────────────────────────────────────────────────────────────────────
local interval = 60
watch('sh -c', interval, function()
  sb_battery()
  sb_volume()
  sb_brightness()
end)
separt = wibox.widget.textbox(" ") --> Separators :


--~~~~~~~~~~~~~~~~~~~~~~~~ cpu widget ~~~~~~~~~~~~~~~~~~~~~~~~~~
local cpu = lain.widget.cpu {
  settings = function() widget:set_markup(" " .. cpu_now.usage .. " %") end
}
cpu.widget.font = theme.iconfont
mycpu = wibox.widget { { { widget = cpu.widget
},
  fg = colors.blue,
  widget = wibox.container.background
},
  color = colors.blue,
  widget = wibox.container.margin
}


--~~~~~~~~~~~~~~~~~~~~~~~~ ram widget ~~~~~~~~~~~~~~~~~~~~~~~~~~
local mem = lain.widget.mem {
  settings = function()
    widget:set_markup(" " .. mem_now.used .. "MB")
  end
}
mem.widget.font = theme.iconfont
mymem = wibox.widget {
  {
    {
      widget = mem.widget,

    },
    fg = colors.green,
    widget = wibox.container.background
  },
  color = colors.green,
  widget = wibox.container.margin
}


--~~~~~~~~~~~~~~~~~~~~~~~ temp widget ~~~~~~~~~~~~~~~~~~~~~~~~~~
local temp = lain.widget.temp {
  settings = function()
    widget:set_markup(" " .. coretemp_now .. "°C ")
  end
}
temp.widget.font = theme.font
mytemp = wibox.widget {
  {
    {
      widget = temp.widget
    },
    fg = colors.brightred,
    widget = wibox.container.background
  },
  color = colors.brightred,
  widget = wibox.container.margin
}


--~~~~~~~~~~~~~~~~~~~~~~~ date widget ~~~~~~~~~~~~~~~~~~~~~~~~~~
local date = awful.widget.watch(
  "date +'%a %d %b  %H:%M ' ", 60,
  function(widget, stdout)
    widget:set_markup(" " .. stdout)
  end
)
date.font = theme.font
mydate = wibox.widget {
  {
    {
      widget = date
    },
    fg = colors.brightmagenta,
    widget = wibox.container.background
  },
  color = colors.brightmagenta,
  widget = wibox.container.margin
}


--~~~~~~~~~~~~~~~~~~~~~~ clock widget ~~~~~~~~~~~~~~~~~~~~~~~~~~
local clock = awful.widget.watch(
  "date +'%I:%M %p' ", 60,
  function(widget, stdout)
    widget:set_markup(" " .. stdout)
  end
)
clock.font = theme.bigfont
myclock = wibox.widget {
  {
    {
      widget = clock,
      align = "center"
    },
    fg = colors.brightmagenta, --> text color
    widget = wibox.container.background
  },
  color = colors.brightmagenta,
  widget = wibox.container.margin
}


--~~~~~~~~~~~~~~~~~~~~~~~~~ calender ~~~~~~~~~~~~~~~~~~~~~~~~~~~
theme.cal = lain.widget.cal {
  attach_to = { clock },
  notification_preset = {
    font = theme.font,
    -- fg   = theme.fg_normal,
    fg   = "#f57fff",
    bg   = theme.bg_normal
  }
}


--~~~~~~~~~~~~~~~~~~~~~~~~~ systray ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
theme.systray_icon_spacing = dpi(6)
mytry = wibox.widget {
  {
    {
      widget = wibox.widget.systray()
    },
    fg = colors.brightgreen,
    widget = wibox.container.background
  },
  color = colors.green,
  widget = wibox.container.margin
}


--~~~~~~~~~~~~~~~~~~~~~~~ temp widget ~~~~~~~~~~~~~~~~~~~~~~~~~~
-- LayoutBox
awful.screen.connect_for_each_screen(function(s)
  awful.tag(awful.util.tagnames, s, awful.layout.layouts[1]) --> Each screen has its own tag table.

  s.mypromptbox = awful.widget.prompt() --> Create a promptbox for each screen

  --> Create an imagebox widget which will contain an icon indicating which layout we're using.
  --> We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox {
    screen  = s,
    buttons = {
      awful.button({}, 1, function() awful.layout.inc(1) end),
      awful.button({}, 3, function() awful.layout.inc(-1) end),
      awful.button({}, 4, function() awful.layout.inc(-1) end),
      awful.button({}, 5, function() awful.layout.inc(1) end),
    }
  }


  --~~~~~~~~~~~~~~~~~~~~~~~ temp widget ~~~~~~~~~~~~~~~~~~~~~~~~~~
  --> Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = {
      awful.button({}, 1, function(t) t:view_only() end),
      awful.button({ modkey }, 1, function(t)
        if client.focus then
          client.focus:move_to_tag(t)
        end
      end),
      awful.button({}, 3, awful.tag.viewtoggle),
      awful.button({ modkey }, 3, function(t)
        if client.focus then
          client.focus:toggle_tag(t)
        end
      end),
    },
  }

  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    left    = 9,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = {
      awful.button({}, 1, function(c)
        c:activate { context = "tasklist", action = "toggle_minimization" }
      end),
      awful.button({}, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
      awful.button({}, 4, function() awful.client.focus.byidx(-1) end),
      awful.button({}, 5, function() awful.client.focus.byidx(1) end),
    },
  }



  --────────────────────────────────────────────────────────────────────
  --░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ wibar ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
  --────────────────────────────────────────────────────────────────────
  s.mywibox = awful.wibar {
    position = "top",
    screen   = s,
    height   = 45,
    margins  = { top = 12, left = 12, right = 12 },
    bg       = colors.bar,
    shape    = helpers.rrect(dpi(15)),
    type     = "dock",
    -- border_width = 5,
    -- border_color = "#00000000",


    --~~~~~~~~~~~~~~~~~~~~ widget in wibar ~~~~~~~~~~~~~~~~~~~~~~~~~
    widget = {
      layout = wibox.layout.align.horizontal,
      { ------------- Left widgets ----------
        layout = wibox.layout.fixed.horizontal,
        barcontainer(mylauncher),
        barcontainer(s.mytaglist),
        barcontainer(bookmark_widget),
        barcontainer(todo_widget()),
      },

      -------------- Middle widget ----------
      myclock,
      -- s.mytasklist,
      -- barcontainer(s.mytasklist),
      -- nil,

      { ------------- Right widgets ---------
        layout = wibox.layout.fixed.horizontal,
        barcontainer(batteryarc_widget({
          show_current_level = true,
          arc_thickness = 1,
        })),
        barcontainer(mycpu),
        barcontainer(mymem),
        barcontainer(mytry),
        barcontainer(powermenu),
        barcontainer(s.mylayoutbox),
        -- barcontainer(mytemp),
        -- separt,
      },
    }
  }
end)
