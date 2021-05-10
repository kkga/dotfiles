function man --description "Open manpage"
    kak -e "set buffer readonly true; map global normal q :quit<ret>; man $argv"
end
