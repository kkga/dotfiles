widget = {
    plugin = "timer",
    opts = {period = 5 * 60},
    cb = function(t)
        os.execute("doas xbps-install -S")
        local f = assert(io.popen("doas xbps-install -un | wc -l"))
        local res = f:read("*all")
        if tonumber(res) > 0 then
            return {
                full_text = string.format("⇪ %d", res) 
            }
        end
    end
}
