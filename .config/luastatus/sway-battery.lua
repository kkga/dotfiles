widget =
    luastatus.require_plugin("battery-linux").widget {
    period = 2,
    cb = function(t)
        if t.status == nil then
            return
        end

        local symbol =
            ({
            Charging = "",
            Discharging = ""
        })[t.status] or " "

        local color
        if t.capacity < 15 then
            color = "#ff8888"
        end

        local h = math.floor(t.rem_time)
        local m = math.floor(60 * (t.rem_time - h))
        return {
            {full_text = string.format("%s %d%% (%d:%02d)", symbol, t.capacity, h, m), color = color}
        }
    end
}
