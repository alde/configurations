local awful = require("awful")
local beautiful = require("beautiful")
local io = io
local table = table
local awesome = awesome
local ipairs = ipairs
local os = os
local string = string
local mouse = mouse


-- menu
local terminal = "urxvt "
local man = "urxvt -e man "
local editor = "urxvt -e vim "
local run = "gmrun "
local fileman = terminal .. " -e ranger "
local messenger = "pidgin"

local myawesomemenu = {
    { "Edit config", editor .. awful.util.getdir("config") .. "/rc.lua"},
    { "Edit widgets functions", editor .. awful.util.getdir("config") .. "/widgets_fun.lua" },
    { "Edit widgets", editor .. awful.util.getdir("config") .. "/widgets.lua" },
    { "Edit main menu", editor .. awful.util.getdir("config") .. "/mainmenu.lua" },
    { "Edit calendar", editor .. awful.util.getdir("config") .. "/calendar2.lua" },
    { "Restart", awesome.restart },
    { "Stop", awesome.quit }
}

local appmenu_items = {}

local mymainmenu_items = {
    { "Run", run,  },
    { "Terminal", terminal,  },
    { "FileMan", fileman,  },
    { "Pidgin", messenger,  },
    { "< AppMenu >", appmenu_items,  },
    { "Awesome", myawesomemenu,  },
    { "Halt", shutdown,  }
}

return awful.menu({ items = mymainmenu_items })
