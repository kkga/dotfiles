# try %{
#     decl str sneak_last
#     decl str sneak_dir /
#     addhl window/ dynregex '%opt{sneak_last}' 0:+u
# }

# def sneak-fwd %{
#     set window sneak_dir /
#     sneak-start
# }

# def sneak-bwd %{
#     set window sneak_dir <a-/>
#     sneak-start
# }

# def sneak-start %{
#     set window sneak_last ""
#     on-key %{
#         sneak-cont %val{key}
#     }
# }

# def sneak-cont -params 1 %{
#     set window sneak_last "%arg{1}"
#     on-key %{
#         set window sneak_last "%arg{1}%val{key}"
#         exec -save-regs '' %opt{sneak_dir} \Q %opt{sneak_last} <ret>
#     }
# }

# map global normal f ': sneak-fwd<ret>'
# map global normal F ': sneak-bwd<ret>'

try %{
    decl str sneakdir
    decl str sneak1
    decl str sneak2
}

def forward         -params 1 %{ %arg{1} /     }
def forward-extend  -params 1 %{ %arg{1} ?     }
def backward        -params 1 %{ %arg{1} <a-/> }
def backward-extend -params 1 %{ %arg{1} <a-?> }

def sneak-standard -params 1 %{
    set window sneakdir %arg{1}
    sneak-start %{
        exec -save-regs '' %opt{sneakdir} \Q %opt{sneak1} %opt{sneak2} <ret>
    }
}

def sneak-word -params 1 %{
    set window sneakdir %arg{1}
    sneak-start %{
        exec -save-regs '' %opt{sneakdir} \b[\w-]*\Q %opt{sneak1} \E[\w-]*\Q %opt{sneak2} \E[\w-]*\b <ret>
    }
}

def sneak-start -params 1 %{
    on-key %{
        set window sneak1 %val{key}
        on-key %{
            set window sneak2 %val{key}
            eval -save-regs '' %arg{1}
        }
    }
}

map global normal f     ': forward         sneak-standard<ret>'
map global normal F     ': forward-extend  sneak-standard<ret>'
map global normal <a-f> ': backward        sneak-standard<ret>'
map global normal <a-F> ': backward-extend sneak-standard<ret>'

# map global user s     ': forward           sneak-word<ret>'
# map global user S     ': forward-extend    sneak-word<ret>'
# map global user <a-s> ': backward          sneak-word<ret>'
# map global user <a-S> ': backward-extend   sneak-word<ret>'
