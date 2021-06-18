# Auto-pairing of characters
# Heavily based on Visual Studio Code.
# https://code.visualstudio.com
#
# Usage:
#
# enable-auto-pairs
#
# How does it work?
#
# The script installs hooks on opening pairs.
#
# When closing a pair for you, it activates the following functionalities:
#
# – {closing-pair} ⇒ Move right in pair
# – Enter ⇒ Insert a new indented line in pair
# – Backspace ⇒ Erases the whole bracket
#
# When moving or leaving insert mode, the functionalities deactivates.

# Auto-pairing of characters activates only when this expression does not fail.
# By default, it avoids escaped pairs and word characters.
declare-option -docstring 'auto-pairing of characters activates only when this expression does not fail' str auto_close_trigger %{
  set-register / "[^\\]?\Q%opt{opening_pair}\E\W\z"
  execute-keys '<a-h><a-k><ret>'
}

# Internal variables
declare-option -hidden str opening_pair
declare-option -hidden int inserted_pairs

# Retain inserted pairs
remove-hooks global clean-auto-pairs-state
hook -group clean-auto-pairs-state global WinSetOption 'inserted_pairs=0' %{
  unmap window insert
  remove-hooks window auto-pairs
}

define-command -override enable-auto-pairs -docstring 'enable auto-pairs' %{
  remove-hooks global auto-pairs
  auto-close-nestable-pair ( )
  auto-close-nestable-pair { }
  auto-close-nestable-pair [ ]
}

define-command -override disable-auto-pairs -docstring 'disable auto-pairs' %{
  remove-hooks global auto-pairs
}

# Internal commands
define-command -override -hidden auto-close-nestable-pair -params 2 %{
  hook -group auto-pairs global InsertChar "\Q%arg{1}" "handle-inserted-opening-pair %%🐈%arg{1}🐈 %%🐈%arg{2}🐈"
  hook -group auto-pairs global InsertDelete "\Q%arg{1}" "handle-deleted-opening-pair %%🐈%arg{1}🐈 %%🐈%arg{2}🐈"
}

define-command -override -hidden handle-inserted-opening-pair -params 2 %{
  try %{
    # Test whether the commands contained in the option pass.
    # If not, it will throw an exception and execution will jump to
    # the “catch” block below.
    set-option window opening_pair %arg{1}
    evaluate-commands -draft -save-regs '/' %opt{auto_close_trigger}

    # Action: Close pair
    execute-keys %arg{2}

    # Preserve selected text
    try %{
      execute-keys -draft '<a-k>..<ret>'
      execute-keys '<a-;>H'
    } catch %{
      execute-keys '<a-;>h'
    }

    # Add insert mappings
    map window insert %arg{2} '<a-;>:auto-pairs-move-right<ret>'
    map window insert <ret> '<a-;>:auto-pairs-insert-new-line<ret>'

    # Keep the track of inserted pairs
    increment-inserted-pairs-count

    # Clean state when moving or leaving insert mode
    hook -group auto-pairs -once window InsertMove '.*' %{
      reset-inserted-pairs-count
    }
    hook -group auto-pairs -once window InsertChar '.*' %{
      unmap window insert <ret>
    }
    hook -always -once window ModeChange 'pop:insert:normal' %{
      reset-inserted-pairs-count
    }
  }
}

define-command -override -hidden handle-deleted-opening-pair -params 2 %{
  try %{
    execute-keys -draft "<space>;<a-k>\Q%arg{2}<ret>"
    execute-keys '<del>'
    decrement-inserted-pairs-count
  }
}

# Insert mappings
define-command -override -hidden auto-pairs-move-right %{
  execute-keys '<a-;>l'
  decrement-inserted-pairs-count
}

define-command -override -hidden auto-pairs-insert-new-line %{
  execute-keys '<esc>;i<ret><ret><esc>KK<a-&>j<a-gt>'
  execute-keys -with-hooks A
  reset-inserted-pairs-count
}

# Increment and decrement inserted pairs count
define-command -override -hidden increment-inserted-pairs-count %{
  set-option -add window inserted_pairs 1
}

define-command -override -hidden decrement-inserted-pairs-count %{
  set-option -remove window inserted_pairs 1
}

define-command -override -hidden reset-inserted-pairs-count %{
  set-option window inserted_pairs 0
}

# Fixture
map -docstring 'repeat last insert command' global normal . '\.'