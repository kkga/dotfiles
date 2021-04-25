define-command files -docstring 'Open one or many files' %{ evaluate-commands %sh{
    FILES=$(fd --hidden --type file | bemenu --fn 'monospace 12' -l 8 -p '')
    for file in $FILES; dom
        printf 'eval -client %%{%s} edit %%{%s}\n' "$kak_client" "$file" | kak -p "$kak_session"
    done
} }

define-command buffers -docstring 'Switch to a buffer' %{ evaluate-commands %sh{
    BUFFER=$(eval set -- "$kak_buflist"; for buf in "$@"; do echo "$buf"; done | $DMENU_PROGRAM)
    [ -n "$BUFFER" ] && echo "eval -client '$kak_client' 'buffer $BUFFER'" | kak -p "$kak_session"
} }


define-command fuzzy-open-file %{
    try %sh{
        foot -f 'monospace:size=12' --app-id=popup sh -c "kak_open_file.sh $kak_session $kak_client"
    }
}

