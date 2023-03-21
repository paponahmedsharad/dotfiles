--~~~~~~~~~~~~~~~~~ required module ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local HOME = os.getenv('HOME')
-- local ICON_DIR = '/home/sharad/awesome-wm-widget-tutorial/widgets/bookmark-widget/icons/'
local ICON_DIR = HOME .. '/.config/awesome/themes/custom-icons/'

--- Widget to add to the wibar
local powermenu = wibox.widget {
  {
    text    = "some",
    image   = ICON_DIR .. 'power.svg',
    -- image   = "/home/sharad/.config/awesome/custom-icons/bookmark.svg",
    opacity = 0.8,
    resize  = true,
    widget  = wibox.widget.imagebox,
  },
  margins = 0,
  layout = wibox.container.margin
}



-- Mouse click handler
powermenu:buttons(
  awful.util.table.join(
    awful.button({}, 1, function()
      awful.util.spawn_with_shell("eww open-many --toggle background-closer powermenu", false)
    end)
  )
)
return powermenu
