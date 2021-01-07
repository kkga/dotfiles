widget = {
    plugin = 'network-linux',
    opts = {
        wireless = true,
        timeout = 10,
    },
    cb = function(t)
        if not t then
            return nil
        end
        local r = {}
        for iface, params in pairs(t) do
            if params.wireless then
                r[#r + 1] = {
                    full_text = string.format('%s (%s)', params.wireless.ssid, params.wireless.signal_dbm)
                }
            end
        end
        return r
    end,
}
