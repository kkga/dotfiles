# cursorline highlighting
declare-option str cursorline_bg rgba:7F7F7F16

define-command cursorline-toggle %{
    try %{
        set-face global CursorLine "default,%opt{cursorline_bg}"
        add-highlighter window/cursorline fill Normal  # dummy to throw error if enabled
        hook window -group cursorline NormalKey .* %{
            remove-highlighter window/cursorline
            add-highlighter window/cursorline line %val{cursor_line} CursorLine
        }
    } catch %{
        remove-highlighter window/cursorline
        remove-hooks window cursorline
    }
}

# line-numbers highlighting
define-command line-numbers-toggle -params .. %{
    try %{
        add-highlighter window/line-numbers number-lines -hlcursor -separator ' ' %arg{@}
    } catch %{
        remove-highlighter window/line-numbers
    }
}

# show whitespaces
define-command -params 0 whitespaces-toggle %{
    try %{
        add-highlighter window/whitespaces show-whitespaces -tab "»" -lf "↲" -nbsp "␣" -spc "·"
    } catch %{
        remove-highlighter window/whitespaces
    }
}

# soft line-wrapping
define-command -params 0 softwrap-toggle %{
    try %{
        add-highlighter window/wrap wrap -marker "…"
    } catch %{
        remove-highlighter window/wrap
    }
}


