local widget = {}

local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

function widget.xbps_updates()
    local txt = wibox.widget.textbox()
    txt.font = "monospace 10"
    txt.visible = false

    local function update()
        awful.spawn.easy_async(
            {"xbps-install", "-un"}, --
            function(stdout)
                local x = gears.string.linecount(stdout) - 1
                if x > 0 then
                    txt.visible = true
                    txt.markup = string.format(
                        [[<span fgcolor="#20ff40">[↑%d]</span>]], x
                    )
                else
                    txt.visible = false
                end
            end
        )
    end

    txt:buttons(
        awful.button(
            {}, 1, nil, function()
                awful.spawn.easy_async(
                    {
                        "alacritty",
                        "-e",
                        "fish",
                        "-c",
                        "fish_prompt; echo sudo xbps-install -Suy; sudo xbps-install -Suy",
                    }, --
                    function()
                        awful.spawn.easy_async({"sudo", "xsync"}, update)
                    end
                )
            end
        )
    )

    return awful.widget.watch(
        {"doas", "xsync"}, 1800, update, --
        wibox.container.margin(txt, 8, 0, 0, 0, nil, false)
    )
end


return widget
