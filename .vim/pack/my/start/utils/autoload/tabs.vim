" Smart tab for completion
function! tabs#smart_tab()
    let col = virtcol('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-n>"
    endif
endfunction
