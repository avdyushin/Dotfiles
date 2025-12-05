if status is-interactive
    # Commands to run in interactive sessions can go here
end

source $HOME/.zshenv

function last_history_item; echo $history[1]; end
function last_history_token
    echo $history[1] | read -t -a tokens
    echo $tokens[-1]
end

abbr --add rm 'rm -i'
abbr --add mv 'mv -i'
abbr --add grep 'grep --color=always'

abbr --add l 'la'
abbr --add gg --set-cursor 'grep -rniEIR \'%\''
abbr --add less 'less --no-histdups'

switch (uname)
    case Darwin
        abbr --add iousb 'ioreg -p IOUSB'
end

abbr --add L --position anywhere --set-cursor '% | less -R'
abbr --add G --position anywhere --set-cursor '% | grep'
abbr --add '>' --position anywhere '>?'

abbr --add !! --position anywhere --function last_history_item
abbr --add !\$ --position anywhere --function last_history_token
