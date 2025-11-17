if status is-interactive
    # Commands to run in interactive sessions can go here
end

source $HOME/.zshenv

abbr rm 'rm -i'
abbr mv 'mv -i'
abbr grep 'grep --color=always'

abbr --add l la
abbr --add gg grep -rniEIR
abbr --add iousb ioreg -p IOUSB
abbr --add less less --no-histdups

abbr --add L --position anywhere --set-cursor "% | less -R"
abbr --add G --position anywhere --set-cursor '% | grep'
abbr --add '>' --position anywhere '>?'
