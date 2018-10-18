if !exists("g:cargo_command")
  let g:cargo_command = "cargo"
endif

function! CargoTest()
    execute "!" . g:cargo_command . " test -- --nocapture"
endfunction

function! PrettyFormat()
  let line = line('.')
  execute "%!" . g:cargo_command . " fmt 2>/dev/null"
  execute line
endfunction

set tabstop=4
set shiftwidth=4
set softtabstop=4

setlocal shellpipe=2> "Collect only stderr
setlocal makeprg=~/.vim/build/cargo_test.py "Cargo test and process output for Quickfix
setlocal errorformat=
    \%WWarning:\ %f:%l:%c\ %m,
    \%IFailed:\ %f:%l:%c\ %m,
    \%EError:\ %f:%l:%c\ %m

let maplocalleader = ","
nnoremap <buffer> <localleader>f :call PrettyFormat()<Enter>
nnoremap <buffer> <localleader>t :w<Enter> :call CargoTest()<Enter>

