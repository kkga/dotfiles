# Dracula theme for Kakoune
# https://draculatheme.com/kakoune

# Color palette
# https://github.com/dracula/dracula-theme#color-palette
declare-option str black 'rgb:262626'
declare-option str brblack 'rgb:444444'
declare-option str gray 'rgb:BCBCBC'
declare-option str white 'rgb:FFFFFF'
declare-option str blue 'rgb:87AFD7'
declare-option str cyan 'rgb:5FAFAF'
declare-option str green 'rgb:87AF87'
declare-option str purple 'rgb:8787AF'
declare-option str red 'rgb:FF8700'
declare-option str yellow 'rgb:FFFFAF'

declare-option str background %opt{black}
declare-option str dimmed_background %opt{brblack}
declare-option str foreground %opt{white}

# Reference
# https://github.com/mawww/kakoune/blob/master/colors/default.kak
# For code
set-face global value "%opt{green}"
set-face global type "%opt{purple}"
set-face global variable "%opt{red}"
set-face global module "%opt{red}"
set-face global function "%opt{red}"
set-face global string "%opt{yellow}"
set-face global keyword "%opt{cyan}"
set-face global operator "%opt{yellow}"
set-face global attribute "%opt{red}"
set-face global comment "%opt{gray}"
set-face global meta "%opt{red}"
set-face global builtin "%opt{white}+b"

# For markup
set-face global title "%opt{red}+b"
set-face global header "%opt{yellow}"
set-face global bold "%opt{red}"
set-face global italic "%opt{purple}"
set-face global mono "%opt{green}"
set-face global block "%opt{cyan}"
set-face global link "%opt{green}"
set-face global bullet "%opt{green}"
set-face global list "%opt{white}"

# Builtin faces
set-face global Default "%opt{gray},%opt{black}"
set-face global PrimarySelection "%opt{black},%opt{blue}"
set-face global SecondarySelection "%opt{black},%opt{purple}"
set-face global PrimaryCursor "%opt{black},%opt{cyan}"
set-face global SecondaryCursor "%opt{black},%opt{yellow}"
set-face global PrimaryCursorEol "%opt{black},%opt{cyan}"
set-face global SecondaryCursorEol "%opt{black},%opt{yellow}"
set-face global LineNumbers "%opt{gray},%opt{black}"
set-face global LineNumberCursor "%opt{white},%opt{gray}+b"
set-face global LineNumbersWrapped "%opt{gray},%opt{black}"
set-face global MenuForeground "%opt{black},%opt{white}+b"
set-face global MenuBackground "%opt{white},%opt{brblack}"
set-face global MenuInfo "%opt{cyan},%opt{blue}"
set-face global Information "%opt{yellow},%opt{gray}"
set-face global Error "%opt{black},%opt{red}"
set-face global StatusLine "%opt{white},%opt{black}"
set-face global StatusLineMode "%opt{black},%opt{green}"
set-face global StatusLineInfo "%opt{purple},%opt{black}"
set-face global StatusLineValue "%opt{yellow},%opt{black}"
set-face global StatusCursor "%opt{white},%opt{blue}"
set-face global Prompt "%opt{black},%opt{green}"
set-face global MatchingChar "%opt{black},%opt{blue}"
set-face global Whitespace "%opt{gray},%opt{black}+f"
set-face global WrapMarker Whitespace
set-face global BufferPadding "%opt{gray},%opt{black}"
