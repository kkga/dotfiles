widget = {
    plugin = "timer",
    opts = {period = 5 * 60},
    cb = function(t)
        os.execute("doas xbps-install -S")
        local f = assert(io.popen("xbps-install -un | wc -l"))
        local res = f:read("*all")
        local color = "#ff8888"
        if tonumber(res) > 0 then
            return {
                full_text = string.format("⇪ %d", res), color = color
            }
        end
    end
}
