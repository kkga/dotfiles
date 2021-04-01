define-command files -docstring 'Open one or many files' %{ evaluate-commands %sh{
    FILES=$(fd --hidden --type file | term-dmenu)
    for file in $FILES; do
        printf 'eval -client %%{%s} edit %%{%s}\n' "$kak_client" "$file" | kak -p "$kak_session"
    done
} }

define-command buffers -docstring 'Switch to a buffer' %{ evaluate-commands %sh{
    BUFFER=$(eval set -- "$kak_buflist"; for buf in "$@"; do echo "$buf"; done | term-dmenu)
    [ -n "$BUFFER" ] && echo "eval -client '$kak_client' 'buffer $BUFFER'" | kak -p "$kak_session"
} }
