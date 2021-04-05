hook global WinSetOption filetype=markdown %{
    map buffer normal <ret> %{: toggle-checkbox<ret>} -docstring "toggle checkbox"
    map buffer normal <a-ret> %{: toggle-todo<ret>} -docstring "toggle todo"
}

define-command toggle-checkbox %{
    try %{
        # mark complete
    	execute-keys -draft "xs- \[ \]<ret>c- [x]<esc>"
	} catch %{
        # mark incomplete
    	execute-keys -draft "xs- \[x\]<ret>c- [ ]<esc>"
	} catch %{
        # add checkbox if it doesn't exist
        execute-keys -draft "xs- <ret>a[ ] <esc>"
    } catch %{
		echo -markup "{Information}Should be on a list item"
    }
} -docstring 'toggle checkbox state'

define-command toggle-todo %{
    try %{
        # remove checkbox
        execute-keys -draft "xs- \[.\]<ret>c-<esc>"
    } catch %{
        # add checkbox
        execute-keys -draft "xs- <ret>a[ ] <esc>"
    } catch %{
		echo -markup "{Information}Should be on a list item"
    }
}
