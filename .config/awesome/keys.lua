-- vim:foldmethod=marker
local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup")

local tagkeys = {"q", "w", "e", "a", "s", "d"}

local modkey = "Mod4"

local keys = {
    global = {},
    client = {}
}

-- {{{ Global keys
for i,t in ipairs(tagkeys) do
    keys.global = gears.table.join(keys.global,
	-- View tag
	awful.key({ modkey }, t,
	    function ()
		local tag = awful.screen.focused().tags[i]
		if tag then
		    tag:view_only()
		end
	    end,
	    {description = "view tag #"..i, group = "tag"}),

	-- Move client to tag
	awful.key({ modkey, "Shift" }, t,
	    function ()
		if client.focus then
		    local tag = client.focus.screen.tags[i]
		    if tag then
			client.focus:move_to_tag(tag)
		    end
		end
	    end,
	    {description = "move to tag #"..i, group = "tag"})
    )
end


keys.global = gears.table.join(keys.global,
    awful.key({ modkey,           }, "/",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
    awful.key({ modkey,           }, "Tab", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    -- Focus clients
    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),

    -- Layout resize
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous", group = "layout"}),
              
    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),

    -- Prompt
    awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

    -- Toggle bar
    awful.key({ modkey }, "b",
                function ()
                    local screen = awful.screen.focused()
                    screen.mywibox.visible = not screen.mywibox.visible
                end,
                {description = "toggle bar", group = "bar"}),

    -- Lua prompt
    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"})

    -- PulseAudio volume control
    -- awful.key({ }, "XF86AudioRaiseVolume",
    --     function ()
    --         os.execute("volume.sh -i 5")
    --     end),
    -- awful.key({ }, "XF86AudioLowerVolume",
    --     function ()
    --         os.execute("volume.sh -d 5")
    --     end)
    -- awful.key({ altkey }, "m",
    --     function ()
    --         os.execute(string.format("pactl set-sink-mute %s toggle", volume.device))
    --         volume.update()
    --     end),
    -- awful.key({ altkey, "Control" }, "m",
    --     function ()
    --         os.execute(string.format("pactl set-sink-volume %s 100%%", volume.device))
    --         volume.update()
    --     end),
    -- awful.key({ altkey, "Control" }, "0",
    --     function ()
    --         os.execute(string.format("pactl set-sink-volume %s 0%%", volume.device))
    --         volume.update()
    -- end)
)
-- }}}

-- {{{ Client keys
keys.client = gears.table.join(
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)
-- }}}

return keys
