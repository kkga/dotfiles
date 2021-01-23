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
                local weak_label = ""
                if params.wireless.signal_dbm < -70 then
                    weak_label = " (weak)"
                end
                r[#r + 1] = {
                    full_text = string.format('%s%s', params.wireless.ssid, weak_label)
                }
            end
        end
        return r
    end,
}
