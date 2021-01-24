widget = {
    plugin = 'alsa',
    cb = function(t)
        if t.mute then
            return {full_text = 'MUT', color = "ff8888"}
        else
            local percent = (t.vol.cur - t.vol.min) / (t.vol.max - t.vol.min) * 100
            return {full_text = string.format('%2d%%', math.floor(0.5 + percent))}
        end
    end,
}
