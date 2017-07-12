if !exists("g:ruby_command")
  let g:ruby_command = "ruby"
endif

function! Run()
  silent !clear
  execute "!" . g:ruby_command . " " . bufname("%") " | less -d +G"
endfunction

let maplocalleader = ","
nnoremap <buffer> <localleader>r :w<Enter> :call Run()<Enter>
