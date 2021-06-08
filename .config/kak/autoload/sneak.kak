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
