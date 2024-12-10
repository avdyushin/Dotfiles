if !has("spell")
    finish
endif
" Spelling
" ]s - next misspelled word
" [s - previous misspelled word
" z= - show suggestions
" zg - add word as 'good' into spellfile
" zw - add word as 'wrong' into spellfile
function! spelling#toggle()
    if &spell == 0
        setlocal spell
    else
        setlocal nospell
    endif
    echo s:message()
endfunction

function! spelling#set(...)
    setlocal spell
    setlocal spelllang=
    " Same as execute 'setlocal spelllang+=' . join(a:000, ',')
    let &l:spelllang .= join(a:000, ',')
    echo s:message()
endfunction

function! s:message()
    return 'Spelling ' . &spelllang . ' has been ' . (&spell == 1 ? 'enabled' : 'disabled')
endfunction
