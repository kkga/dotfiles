-- map caps to control in system preferences for this to work as expected:
-- tap caps for esc, hold caps for control
hs.loadSpoon("ControlEscape"):start()

function changeVolume(diff)
  return function()
    local current = hs.audiodevice.defaultOutputDevice():volume()
    local new = math.min(100, math.max(0, math.floor(current + diff)))
    if new > 0 then
      hs.audiodevice.defaultOutputDevice():setMuted(false)
    end
    hs.alert.closeAll(0.0)
    hs.alert.show("Volume " .. new .. "%", {}, 0.5)
    hs.audiodevice.defaultOutputDevice():setVolume(new)
  end
end

hs.hotkey.bind({'cmd'}, 'F11', changeVolume(-5))
hs.hotkey.bind({'cmd'}, 'F12', changeVolume(5))
