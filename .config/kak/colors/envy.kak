# envy theme
declare-option str envy_darker_grey  'rgb:000000'
declare-option str envy_dark_grey    'rgb:585858'
declare-option str envy_grey         'rgb:6c6c6c'
declare-option str envy_light_grey   'rgb:dadada'
declare-option str envy_lighter_grey 'rgb:eeeeee'
declare-option str envy_red          'rgb:d70000'
declare-option str envy_light_red    'rgb:ffafaf'
declare-option str envy_orange       'rgb:d75f00'
declare-option str envy_purple       'rgb:5f00d7'
declare-option str envy_green        'rgb:005f00'
declare-option str envy_blue         'rgb:005fd7'
declare-option str envy_light_blue   'rgb:afd7ff'

# code
set-face global value "%opt{envy_green}"
set-face global type "%opt{envy_blue}"
set-face global variable "%opt{envy_green}"
set-face global module "%opt{envy_green}"
set-face global function "%opt{envy_blue}"
set-face global string "%opt{envy_green}"
set-face global keyword "%opt{envy_darker_grey}+b"
set-face global operator "%opt{envy_green}"
set-face global attribute "%opt{envy_blue}"
set-face global comment "%opt{envy_grey}"
set-face global meta "%opt{envy_purple}"
set-face global builtin "%opt{envy_darker_grey}+b"

# markup
set-face global title "%opt{envy_darker_grey}+b"
set-face global header "%opt{envy_darker_grey}+b"
set-face global mono "%opt{envy_green}"
set-face global block "%opt{envy_light_blue}"
set-face global link "%opt{envy_green}"
set-face global bullet "%opt{envy_green}"
set-face global list "%opt{envy_blue}"

# built in faces
set-face global Default "%opt{envy_darker_grey},%opt{envy_lighter_grey}"
set-face global PrimarySelection "%opt{envy_lighter_grey},%opt{envy_blue}+fg"
set-face global SecondarySelection "%opt{envy_darker_grey},%opt{envy_light_blue}+fg"
set-face global PrimaryCursor "%opt{envy_lighter_grey},%opt{envy_darker_grey}+fg"
set-face global SecondaryCursor "%opt{envy_lighter_grey},%opt{envy_darker_grey}+fg"
set-face global PrimaryCursorEol "%opt{envy_lighter_grey},%opt{envy_orange}+fg"
set-face global SecondaryCursorEol "%opt{envy_lighter_grey},%opt{envy_orange}+fg"
set-face global LineNumbers "%opt{envy_grey},%opt{envy_light_grey}"
set-face global LineNumberCursor "%opt{envy_lighter_grey},%opt{envy_grey}"
set-face global LineNumbersWrapped "%opt{envy_light_grey},%opt{envy_light_grey}"
set-face global MenuForeground "%opt{envy_lighter_grey},%opt{envy_blue}"
set-face global MenuBackground "%opt{envy_darker_grey},%opt{envy_light_grey}"
set-face global MenuInfo "%opt{envy_grey}"
set-face global Information "%opt{envy_blue},%opt{envy_light_blue}"
set-face global Error "%opt{envy_light_grey},%opt{envy_red}"
set-face global StatusLine "%opt{envy_darker_grey},%opt{envy_light_grey}"
set-face global StatusLineMode "%opt{envy_lighter_grey},%opt{envy_blue}+b"
set-face global StatusLineInfo "%opt{envy_blue},%opt{envy_light_blue}"
set-face global StatusLineValue "%opt{envy_darker_grey},%opt{envy_light_blue}"
set-face global StatusCursor "%opt{envy_lighter_grey},%opt{envy_darker_grey}"
set-face global Prompt "%opt{envy_lighter_grey},%opt{envy_blue}"
set-face global MatchingChar "%opt{envy_darker_grey},%opt{envy_light_blue}"
set-face global BufferPadding "%opt{envy_light_grey},%opt{envy_lighter_grey}"
set-face global Whitespace "%opt{envy_grey}+f"
set-face global LineFlagErrors "%opt{envy_light_red},%opt{envy_dark_grey}"
set-face global Reference "%opt{envy_darker_grey},%opt{envy_dark_grey}"
set-face global DiagnosticError "red,%opt{envy_darker_grey}+u"
set-face global DiagnosticWarning "yellow,%opt{envy_darker_grey}+u"

# https://github.com/alexherbo2/current-word-highlighter.kak
set-face global CurrentWord "%opt{envy_darker_grey},%opt{envy_light_grey}"
