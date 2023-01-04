-- ## Layouts ##
-- ~~~~~~~~~~~~~~~~~

-- requirements
-- ~~~~~~~~~~~~
local gears = require("gears")
local awful = require("awful")

local bling = require("modules.bling")
-- Tag layout :
tag.connect_signal("request::default_layouts", function()
  awful.layout.append_default_layouts({
    awful.layout.suit.tile,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.floating,
    awful.layout.suit.max,
    -- awful.layout.suit.tile,
    -- awful.layout.suit.floating,
    -- bling.layout.centered,
    -- bling.layout.equalarea,
    -- bling.layout.deck,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
  })
end)

-- client.connect_signal("manage", function (c)
--     c.shape = function(cr,w,h)
--         gears.shape.rounded_rect(cr,w,h,5)
--     end
-- end)

client.connect_signal("manage", function(c)
  c.shape = function(cr, w, h)
    gears.shape.rounded_rect(cr, w, h, 12)
  end
end)




-- client.disconnect_signal("request::geometry", awful.ewmh.client_geometry_requests)
-- -- Connect our own handler
-- client.connect_signal("request::geometry", function(c, ...)
--     if c.class ~= "alacritty" then
--         awful.ewmh.client_geometry_requests(c, ...)
--     end
-- end)


-- client.disconnect_signal("request::geometry", awful.ewmh.client_geometry_requests)
-- client.connect_signal("request::geometry", function(c, context, hints)
--     if c.class == "feh" then
--         workarea = awful.screen.focused().workarea
--         hints = awful.placement.centered(c)
--         hints.width = workarea.width * beautiful.feh_scale
--         hints.height = workarea.height * beautiful.feh_scale
--     end
--     awful.ewmh.client_geometry_requests(c, context, hints)
-- end)
