local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local naughty = naughty
local vicious = require("vicious")
local gears_color = require("gears.color")
local setmetatable = setmetatable
require("widgets_fun")
local widgets_fun = widgets_fun
module("widgets")

-- Keyboard layout widget
kbdwidget = wibox.widget.textbox()
kbdwidget.name = "kbdwidget"
kbdwidget.border_width = 1
kbdwidget.border_color = beautiful.fg_normal
kbdwidget:set_text(" Eng | ")

-- Simple battery widget
batterywidget = wibox.widget.textbox()
batterywidget.name = "batterywidget"
batterywidget.border_width = 1
batterywidget.border_color = beautiful.fg_normal
vicious.register(batterywidget, vicious.widgets.bat, widgets_fun.battery_state_format(),
                    11, "BAT0")

-- Simple battery widget
batterywidget_two = wibox.widget.textbox()
batterywidget_two.name = "batterywidget_two"
batterywidget_two.border_width = 1
batterywidget_two.border_color = beautiful.fg_normal
vicious.register(batterywidget_two, vicious.widgets.bat, widgets_fun.battery_state_format(),
                    11, "BAT1")

-- Simple volume widget
volumewidget = wibox.widget.textbox()
volumewidget.name = "volumewidget"
volumewidget.border_width = 1
volumewidget.border_color = beautiful.fg_normal
volumewidget.align = "center"
volumewidget.width = 50
vicious.register(volumewidget, vicious.widgets.volume, "$2 " .. "$1" .. "% | ", 17, "Master")

--Simple thermal widget
thermwidget = wibox.widget.textbox()
thermwidget.name = "thermwidget"
thermwidget.border_width = 1
thermwidget.border_color = beautiful.fg_normal
thermwidget:set_align("center")
thermwidget.width = 29
vicious.register(thermwidget, vicious.widgets.thermal, widgets_fun.thermal_format,
                    31, "thermal_zone0")

-- CPU load widget
cpubar = awful.widget.progressbar()
gradient_color = {type="linear", from={0.5, 0.5}, to={100, 20}, stops={{0, "#3caa3c"}, {1, "#cd2727"}}}
cpubar:set_color(gradient_color)
cpubar:set_ticks(true)
vicious.register(cpubar, vicious.widgets.cpu, "$1", 1)

-- gmail widget and tooltip
gmailwidget = wibox.widget.textbox()
gmailwidget.name = "gmailwidget"
gmailwidget.border_width = 1
gmailwidget.border_color = beautiful.fg_normal
gmailwidget.align = "center"
gmailwidget.width = 50
gmail_t = awful.tooltip({ objects = { gmailwidget },})

vicious.register(gmailwidget, vicious.widgets.gmail,
                function (widget, args)
                    gmail_t:set_text(args["{subject}"])
                    return "Inbox: "..args["{count}"]
                 end, 60)
