widget = {
    plugin = "network-linux",
        opts = {
        wireless = true,
        ethernet = true,
        timeout = 10
    },
    cb = function(t)
        if not t then
            return nil
        end
        local r = {}
        for iface, params in pairs(t) do
            if params.wireless then
                local name = ""
                local weak_label = ""
                if params.wireless.ssid then
                    name = params.wireless.ssid
                end
                if params.wireless.signal_dbm then
                    if params.wireless.signal_dbm < -70 then
                        weak_label = " (weak)"
                    end
                end
                r[#r + 1] = {
                    full_text = string.format(" %s%s", name, weak_label)
                }
            elseif params.ethernet then
                -- if iface == "tailscale0" then
                --     goto skip
                -- end

                r[#r + 1] = {
                    full_text = string.format("%s", iface)
                }
            elseif (iface ~= 'lo') then
                r[#r + 1] = {
                    full_text = string.format("%s", iface)
                }
            end
            ::skip::
        end
        return r
    end
}
