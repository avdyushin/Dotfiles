function! copy#smart_yank()
    let pattern = '\%' . virtcol('.') . 'v.'
    let line = search(pattern . '*\S', 'bnW')
    if line
        return matchstr(getline(line), pattern)
    else
        return ""
    endif
endfunction
