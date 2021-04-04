hook global WinSetOption filetype=markdown %{
    map buffer normal <ret> %{: toggle-todo<ret>} -docstring "toggle todo"
}

define-command toggle-todo %{
    try %{
        # mark complete
    	execute-keys -draft "ghx_s\[ <ret>;rx"
	} catch %{
        # mark incomplete
    	execute-keys -draft "ghf[lr "
	} catch %{
		echo -markup "{Information}No checkbox on current line"
    }
} -docstring 'toggle todo'
