function man --description "Open manpage"
    kak -e "man $argv; set buffer readonly true; map global normal q :quit<ret>"
end
