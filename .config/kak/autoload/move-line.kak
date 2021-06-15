provide-module move-line %{
  # Move selected lines below
  define-command move-line-below -docstring 'Move selected lines below' %{
    # Select whole lines
    execute-keys '<a-x><a-_><a-:>'

    # Iterate each selection and move the lines below
    evaluate-commands -itersel %{
      execute-keys -draft 'w'
      execute-keys -draft 'Zj<a-x>dzP'
    }
  }

  # Move selected lines above
  define-command move-line-above -docstring 'Move selected lines above' %{
    # Select whole lines
    execute-keys '<a-x><a-_><a-:>'

    # Iterate each selection and move the lines above
    evaluate-commands -itersel %{
      execute-keys -draft '<a-;>b'
      execute-keys -draft '<a-;>Zk<a-x>dzp'
    }
  }
}
