local awful = require("awful")
local beautiful = require("beautiful")

local common_rule = {
  -- All clients will match this rule.
  rule = { },
  properties = {
    border_width = beautiful.border_width,
    border_color = beautiful.border_normal,
    focus = awful.client.focus.filter,
    raise = true,
    keys = clientkeys,
    buttons = clientbuttons,
    screen = awful.screen.preferred,
    placement = awful.placement.no_overlap + awful.placement.no_offscreen,
    size_hints_honor = false }
}
local rules =  {
    common_rule,
    -- Titlebars
    { rule_any = { type = { "dialog", "normal" } },
      properties = { titlebars_enabled = true } },

    -- Set Firefox to always map on the first tag on screen 1.
    { rule = { class = "Firefox" },
      properties = { screen = 1, tag = awful.util.tagnames[1] } },

    { rule = { class = "TelegramDesktop" },
      properties = { screen = 1, tag = awful.util.tagnames[2] } },

    { rule = { class = "Thunderbird" },
      properties = { screen = 1, tag = awful.util.tagnames[2] } },
    { rule = { class = "House Hunter" },
      properties = { floating = true } },

    { rule = { class = "Gimp", role = "gimp-image-window" },
          properties = { maximized = true } },
}


return rules
