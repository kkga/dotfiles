months = {'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep',
    'Oct', 'Nov', 'Dec'}
wdays = {'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'}
widget = {
    plugin = 'timer',
    cb = function()
        local d = os.date('*t')
        return {
            string.format('%s %d %s', wdays[d.wday], d.day, months[d.month]),
            string.format('%d:%02d', d.hour, d.min),
        }
    end,
}
