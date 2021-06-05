define-command -hidden -params 3 inc-dec %{
    try %{
        evaluate-commands %sh{
            [ "$1" = 0 ] && count=1 || count="$1"
            [ "$3" = 0 ] && mult=1  || mult="<c-r>#"
            printf '%s%s\n' 'execute-keys h"_/\d<ret><a-i>na' "$2($count * $mult)<esc> | bc<ret><a-i>n"
        }
    }
}
