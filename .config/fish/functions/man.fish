function man --wraps=kak --description 'view manpage in kakoune'
    if test (count $argv) -lt 2
        set page "$argv[1]"
    else
        set page "$argv[2]($argv[1])"
    end
    kak -e "\
        map global normal d <c-d>;\
        map global normal u <c-u>;\
        map global normal q :quit<ret>;\
        map global normal m ':enter-user-mode man-mode<ret>';\
        man $page;\
        set buffer readonly true\
    ";
end
