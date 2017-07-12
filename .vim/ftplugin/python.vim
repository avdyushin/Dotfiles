if !exists("g:python_command")
  let g:python_command = "python"
endif

function! Run()
  silent !clear
  execute "!" . g:python_command . " " . bufname("%") " | less -d +G"
endfunction

let maplocalleader = ","
nnoremap <buffer> <localleader>r :w<Enter> :call Run()<Enter>
" map <D-r> :w<Enter>:!python %<Enter>
