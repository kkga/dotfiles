declare-option str snippet_dir
set-option global snippet_dir '~/.config/kak/snippets/'

define-command snippet-insert -params 1 -menu -shell-script-candidates %{
    fd --type file . ~/.config/kak/snippets/ | awk -F '/' '{print $NF}'
} %{ execute-keys "|cat ~/.config/kak/snippets/%arg{1}<ret>s\$\d<ret>"
} -docstring "poor man's snippets"
