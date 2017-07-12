function! ReloadVIMRC()
  if expand('%:t') == '.vimrc'
    exec ':so $MYVIMRC'
  endif
endfunction

au BufWritePost * :call ReloadVIMRC()
