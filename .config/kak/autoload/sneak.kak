try %{
    decl str sneak_last
    decl str sneak_dir /
    addhl window/ dynregex '%opt{sneak_last}' 0:+u
}

def sneak-fwd %{
    set window sneak_dir /
    sneak-start
}

def sneak-bwd %{
    set window sneak_dir <a-/>
    sneak-start
}

def sneak-start %{
    set window sneak_last ""
    on-key %{
        sneak-cont %val{key}
    }
}

def sneak-cont -params 1 %{
    set window sneak_last "%arg{1}"
    on-key %{
        set window sneak_last "%arg{1}%val{key}"
        exec -save-regs '' %opt{sneak_dir} \Q %opt{sneak_last} <ret>
    }
}

map global normal f ': sneak-fwd<ret>'
map global normal F ': sneak-bwd<ret>'
