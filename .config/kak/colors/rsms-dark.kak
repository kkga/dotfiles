# rsms dark colors
# https://gist.github.com/rsms/e6ccb8e26a2a42ee2181e14245091f76#file-rsms-dark-sublime-color-scheme
declare-option str red           'rgb:ff1500'
declare-option str orange        'rgb:ff7300'
declare-option str yellow        'rgb:ffff00'
declare-option str green         'rgb:00db6e'
declare-option str cyan          'rgb:00ffff'
declare-option str blue          'rgb:0080ff'

declare-option str fg            'rgb:ffffff'
declare-option str bg            'rgb:151513'
declare-option str unimportant   'rgba:ffffff66'
declare-option str cursor        'rgb:f76ec9'
declare-option str selection     'rgb:66c2ff'

declare-option str fgBase        'rgb:cccccc'
declare-option str selectionBase 'rgba:66c2ff4d'
declare-option str commentBase   'rgba:ffffff4d'
declare-option str typeBase      'rgba:66c2ff4d'
declare-option str errorBase     'rgb:ff5b4d'
declare-option str keywordBase   'rgb:94b3d1'
declare-option str dataBase      'rgb:e8ad7d'

# Reference
# https://github.com/mawww/kakoune/blob/master/colors/default.kak
# For code
set-face global value "%opt{dataBase}"
set-face global type "%opt{typeBase}"
set-face global variable "%opt{dataBase}"
set-face global module "%opt{dataBase}"
set-face global function "%opt{fg}+b"
set-face global string "%opt{dataBase}"
set-face global keyword "%opt{keywordBase}"
set-face global operator "%opt{keywordBase}"
set-face global attribute "%opt{fgBase}"
set-face global comment "%opt{commentBase}"
set-face global meta "%opt{typeBase}"
set-face global builtin "%opt{fg}+b"

# For markup
set-face global title "%opt{fg}+b"
set-face global header "%opt{fg}+b"
set-face global bold "%opt{fgBase}+b"
set-face global italic "%opt{fgBase}"
set-face global mono "%opt{fgBase}"
set-face global block "%opt{fgBase}"
set-face global link "%opt{keywordBase}"
set-face global bullet "%opt{commentBase}"
set-face global list "%opt{commentBase}"

# Builtin faces
set-face global Default "%opt{fgBase},%opt{bg}"
set-face global PrimarySelection "%opt{fg},%opt{selectionBase}"
set-face global SecondarySelection "%opt{fg},%opt{selectionBase}"
set-face global PrimaryCursor "%opt{fg},%opt{cursor}"
set-face global SecondaryCursor "%opt{fg},%opt{cursor}"
set-face global PrimaryCursorEol "%opt{fg},%opt{cursor}"
set-face global SecondaryCursorEol "%opt{fg},%opt{cursor}"
set-face global LineNumbers "%opt{unimportant},%opt{bg}"
set-face global LineNumberCursor "%opt{fgBase},%opt{bg}+b"
set-face global LineNumbersWrapped "%opt{unimportant},%opt{bg}"
set-face global MenuForeground "%opt{fg},%opt{selectionBase}+b"
set-face global MenuBackground "%opt{fgBase},%opt{bg}"
set-face global MenuInfo "%opt{fg},%opt{unimportant}"
set-face global Information "%opt{fg},%opt{unimportant}"
set-face global Error "%opt{fg},%opt{errorBase}"
set-face global StatusLine "%opt{fgBase},%opt{unimportant}"
set-face global StatusLineMode "%opt{fgBase},%opt{unimportant}"
set-face global StatusLineInfo "%opt{fgBase},%opt{unimportant}"
set-face global StatusLineValue "%opt{fgBase},%opt{unimportant}"
set-face global StatusCursor "%opt{fgBase},%opt{unimportant}"
set-face global Prompt "%opt{fgBase},%opt{unimportant}"
set-face global MatchingChar "%opt{fg},%opt{cursor}"
set-face global Whitespace "%opt{unimportant},%opt{bg}+f"
set-face global WrapMarker Whitespace
set-face global BufferPadding "%opt{unimportant},%opt{bg}"
