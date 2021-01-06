months = {
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
}

wdays = {
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat"
}

widget = {
    plugin = 'timer',
    cb = function()
        local d = os.date('*t')
        return {
            {full_text = string.format('%s %d %s', wdays[d.wday], d.day, months[d.month])},
            {full_text = string.format('%d:%02d', d.hour, d.min)},
        }
    end,
}
