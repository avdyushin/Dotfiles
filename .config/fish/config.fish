if status is-interactive
    # Commands to run in interactive sessions can go here
end

source $HOME/.zshenv

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
