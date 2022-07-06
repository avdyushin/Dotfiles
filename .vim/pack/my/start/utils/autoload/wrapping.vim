" Toggle wrapping with line breaks
function! wrapping#toggle()
    if &wrap == 0
        " Turn on wrap
        setlocal wrap
        " Break lines by words
        setlocal linebreak
    else
        " Turn off wrap
        setlocal nowrap
        " Break lines by character
        setlocal nolinebreak
    endif
    echo 'Wrapping had been ' . (&wrap ? 'enabled' : 'disabled')
endfunction
