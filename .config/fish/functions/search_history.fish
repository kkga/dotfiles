function search_history --description "Search command history using fzy. Replace the commandline with the selected command."
    # history merge incorporates history changes from other fish sessions
    builtin history merge
    set command_with_ts (
        # Reference https://devhints.io/strftime to understand strftime format symbols
        builtin history --show-time="%m/%e %H:%M:%S | " |
        fzy --query=(commandline)
    )

    if test $status -eq 0
        set command_selected (string split --max 1 " | " $command_with_ts)[2]
        commandline --replace $command_selected
    end

    commandline --function repaint
end
