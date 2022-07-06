" Smart Backspace in normal mode
" If at the beginning of the line will join to previous
" else will delete character
function! backspace#smart_backspace()
    if virtcol('.') == 1
        execute "normal kJ"
    else
        execute "normal X"
    endif
endfunction
