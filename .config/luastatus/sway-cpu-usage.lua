widget = luastatus.require_plugin('cpu-usage-linux').widget{
    cb = function(usage)
        if usage ~= nil then
            local color
            if usage > 0.25 then
                color = "#ff8888"
            end
            return {full_text = string.format('%5.1f%%', usage * 100), color = color}
        end
    end,
}
