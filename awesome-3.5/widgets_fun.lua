local beautiful = require("beautiful")
local vicious = require("vicious")
local io = io
local math = math
local print = print
local tonumber = tonumber
local pairs = pairs
local naughty = require("naughty")

module("widgets_fun")

function trim(s)
    return s:find'^%s*$' and '' or s:match'^%s*(.*%S)'
end

-- Format function for battery widget
local limits = {{25, 5},
          {12, 3},
          { 7, 1},
            {0}}

function getnextlim (num)
    for ind, pair in pairs(limits) do
    	if (pair == nil or limits == nil) then
    		return 0
    	end
        lim = pair[1] or 0;
        step = pair[2] or 0;
        nextlim = limits[ind+1][1] or 0
        if num > nextlim then
            repeat
                lim = lim - step
            until num > lim
            if lim < nextlim then
                lim = nextlim
            end
            return lim
        end
    end
end

function battery()
    local total_max = 0
    local total_current = 0
    local batteries = {"BAT0", "BAT1"}
    local status = "unknown"

    for i, bat in pairs(batteries) do
        local max = tonumber(
            io.popen(
                "cat /sys/class/power_supply/"..bat.."/energy_full"
            ):read("*all")
        )

        if (max == nil) then
            max = 0
        end

        total_max = total_max + max

        status = io.popen(
            "cat /sys/class/power_supply/"..bat.."/status"
        ):read("*all"):lower()
        total_current = total_current + tonumber(
            io.popen(
                "cat /sys/class/power_supply/"..bat.."/energy_now"
            ):read("*all")
        )
    end

    local time = trim(io.popen("~/bin/battery"):read("*all"))

    return {trim(status), math.floor(total_current/total_max*100), time}
end

function battery_state_format()
    local nextlim = limits[1][1]
    return function (_, args)
        local state, charge, time = args[1], args[2], args[3];
        local prefix = "⚡"
        if not charge then return end

        if state == "discharging" then
            dirsign = "↓"
            prefix = "Bat:"
            if charge <= nextlim then
                naughty.notify({title = "⚡ Attention! ⚡",
                                    text = "The battery is running out! ( ⚡ "..charge.."%)!",
                                    timeout = 7,
                                    position = "bottom_right",
                                    fg = beautiful.fg_focus,
                                    bg = beautiful.bg_focus
                                   })
                nextlim = getnextlim(charge)
            end
        elseif state == "charging" then
            dirsign = "↑"
            nextlim = limits[1][1]
        elseif state ==  "↯" then dirsign = "↯"
        else dirsign = "⌁"
        end
        if time == "N/A" then
            return " "..prefix.." "..dirsign..charge.."%"..dirsign.." | "
        else return " "..prefix.." "..dirsign..charge.."%"..dirsign.." "..time.." | "
        end
    end
end

-- Volume control functions for volume widget

function volume_up(widget)
    io.popen("amixer -q " .. "sset " .. "Master" .. " 2%+"):read("*all")
    vicious.force({ widget, })
end

function volume_down(widget)
    io.popen("amixer -q " .. "sset " .. "Master" .. " 2%-"):read("*all")
    vicious.force({ widget, })
end

function volume_mute(widget)
    io.popen("amixer -q " .. "sset " .. "Master" .. " toggle"):read("*all")
    vicious.force({ widget, })
end

-- Thermal widget format function
function thermal_format(widget,args)
    local temp = args[1]
    if temp > 80 then
                naughty.notify({title = "Внимание!",
                        text = "Critical core temperature reached! ("..temp.."°C)!",
                        timeout = 3,
                        position = "bottom_right",
                        fg = beautiful.fg_focus,
                        bg = beautiful.bg_focus
                       })
    end
    return " "..temp.."° | "
end

