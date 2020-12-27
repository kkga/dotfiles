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
    plugin = "timer",
    cb = function()
        local d = os.date("*t")
        return {
            string.format("%s %d %s %d:%02d", wdays[d.wday], d.day, months[d.month], d.hour, d.min)
        }
    end
}
