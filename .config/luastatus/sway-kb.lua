widget = luastatus.require_plugin('pipe').widget {
    command = 'sway-kb-layout.sh',
    timeout = 2,
    cb = function(t) 
        return { full_text = t }
    end
    
}
