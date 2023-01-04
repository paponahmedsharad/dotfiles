local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local naughty = require("naughty")
local animation = require("modules.animation")



local styles = {}
local function rounded_shape(size, partial)
  if partial then
    return function(cr, width, height)
      gears.shape.partially_rounded_rect(cr, width, height,
        false, true, false, true, 5)
    end
  else
    return function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, size)
    end
  end
end

-- naughty.config.defaults.bg = "#1a1b26"
naughty.config.defaults.fg = "#f56fff"
naughty.config.defaults.border_width = 8
naughty.config.defaults.border_color = "#00000000"
naughty.config.defaults.position = "top_middle"
naughty.config.defaults.margin = 12



-- Error handling :
naughty.connect_signal("request::display_error", function(message, startup)
  naughty.notification {
    position     = "top_right",
    urgency      = "critical",
    autostart    = false,
    timeout      = 4,
    border_width = 4,
    border_color = "#0000000",
    margin       = 25,
    title        = "Oops, an error happened" .. (startup and " during startup!" or "!"),
    message      = message
  }
end)




-- Notifications :
naughty.connect_signal("request::display", function(n)
  naughty.layout.box { notification = n,
  }
end)
