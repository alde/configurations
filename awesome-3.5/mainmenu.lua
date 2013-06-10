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
local terminal = "urxvtc "
local man = "urxvtc -e man "
local editor = "urxvtc -e vim "
local browser = "luakit "
local run = "gmrun "
local fileman = terminal .. " -e ranger "
local torrent = terminal .. " -e rtorrentd "
local messenger = "pidgin"

local myawesomemenu = {
    { "Edit config", editor .. awful.util.getdir("config") .. "/rc.lua"},
    { "Edit theme", editor .. awful.util.getdir("config") .. "/theme.lua" },
    { "Edit widgets", editor .. awful.util.getdir("config") .. "/widgets.lua" },
    { "Edit main menu", editor .. awful.util.getdir("config") .. "/mainmenu.lua" },
    { "Restart", awesome.restart },
    { "Stop", awesome.quit }
}

local appmenu_items = {}

local mymainmenu_items = {
    { "Run", run,  },
    { "Terminal", terminal,  },
    { "FileMan", fileman,  },
    { "Browser", browser,  },
    { "Torrent", torrent,  },
    { "Pidgin", messenger,  },
    { "< AppMenu >", appmenu_items,  },
    { "Awesome", myawesomemenu,  },
    { "Halt", shutdown,  }
}

return awful.menu({ items = mymainmenu_items })
