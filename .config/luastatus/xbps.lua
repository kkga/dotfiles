widget = {
    plugin = "timer",
    opts = {period = 5 * 60},
    cb = function()
        os.execute("doas xbps-install -S")
        local f = assert(io.popen("doas xbps-install -un | wc -l"))
        local res = f:read("*all")
        local output
        if tonumber(res) > 0 then
            output = string.format("⇪ %d", res)
        end
        return output
    end
}
