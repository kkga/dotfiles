# COLORS

declare-option str fg                'rgb:BCBCBC'
declare-option str bg                'rgb:262626'
declare-option str bg_dim            'rgb:303030'
declare-option str black             'rgb:121212'
declare-option str red               'rgb:AF5F5F'
declare-option str green             'rgb:5F875F'
declare-option str yellow            'rgb:AF8700'
declare-option str blue              'rgb:5F87AF'
declare-option str magenta           'rgb:5F5F87'
declare-option str cyan              'rgb:5F8787'
declare-option str white             'rgb:6C6C6C'
declare-option str brblack           'rgb:444444'
declare-option str brred             'rgb:D7875F'
declare-option str brgreen           'rgb:87AF87'
declare-option str bryellow          'rgb:D7AF5F'
declare-option str brblue            'rgb:87AFD7'
declare-option str brmagenta         'rgb:8787AF'
declare-option str brcyan            'rgb:5FAFAF'
declare-option str brwhite           'rgb:FFFFFF'

declare-option str bg_warning        'rgba:AF870044'
declare-option str bg_error          'rgba:AF5F5F44'

# CODE

set-face global type                 "%opt{brblue}"
set-face global value                "%opt{brgreen}"
set-face global variable             "%opt{brblue}"

set-face global attribute            "%opt{brblue}"
set-face global builtin              "%opt{fg}+b"
set-face global comment              "%opt{white}"
set-face global function             "%opt{brblue}"
set-face global identifier           "%opt{brblue}"
set-face global keyword              "%opt{fg}+b"
set-face global meta                 "%opt{brmagenta}"
set-face global module               "%opt{brmagenta}"
set-face global operator             "%opt{brblue}"
set-face global string               "%opt{bryellow}"

# MARKUP

set-face global header               "%opt{brcyan}+b"
set-face global title                "%opt{brcyan}+b"

set-face global block                "%opt{blue}"
set-face global bullet               "%opt{green}"
set-face global list                 "%opt{blue}"
set-face global link                 "%opt{brblue}"

set-face global mono                 "%opt{brgreen}"
set-face global bold                 "%opt{fg},default+b"
set-face global italic               "%opt{fg},default"
set-face global subscript            "%opt{fg}"
set-face global superscript          "%opt{fg}"

# BUILT IN FACES

set-face global Default              "%opt{fg},default"

set-face global PrimarySelection     "%opt{black},%opt{brblue}+fg"
set-face global SecondarySelection   "%opt{black},%opt{blue}+fg"
set-face global PrimaryCursor        "%opt{bg},%opt{fg}+fg"
set-face global SecondaryCursor      "%opt{black},%opt{white}+fg"
set-face global PrimaryCursorEol     "%opt{black},%opt{yellow}+fg"
set-face global SecondaryCursorEol   "%opt{black},%opt{yellow}+fg"

set-face global MenuForeground       "%opt{brwhite},%opt{white}"
set-face global MenuBackground       "%opt{fg},%opt{brblack}"
set-face global MenuInfo             "%opt{yellow}"
set-face global Information          "%opt{bryellow},default"
set-face global Error                "%opt{brwhite},%opt{red}"

set-face global StatusLine           "%opt{fg}"
set-face global StatusLineMode       "%opt{black},%opt{bryellow}"
set-face global StatusLineInfo       "%opt{brblue}"
set-face global StatusLineValue      "%opt{brwhite},%opt{blue}"
set-face global StatusCursor         "%opt{white},%opt{brblack}"
set-face global Prompt               "%opt{bryellow},default"

set-face global LineNumbers          "%opt{white}"
set-face global LineNumberCursor     "%opt{fg}"
set-face global LineNumbersWrapped   "%opt{brblack}"

set-face global BufferPadding        "%opt{brblack}"
set-face global MatchingChar         "default,%opt{brblack}"
set-face global Whitespace           "%opt{brblack}+f"

set-face global Reference            "%opt{white},%opt{brblack}"

set-face global LineFlagErrors       "%opt{brred}"
set-face global DiagnosticError      "%opt{brred},%opt{bg_error}"
set-face global DiagnosticWarning    "%opt{bryellow},%opt{bg_warning}"
