define-command insert-snippet -params 1 -menu -shell-script-candidates %{
    fd --type file . ~/.config/kak/snippets/ | awk -F '/' '{print $NF}'
} %{ execute-keys "|cat ~/.config/kak/snippets/%arg{1}<ret>s\$\d<ret>n"
} -docstring "poor man's snippets"
