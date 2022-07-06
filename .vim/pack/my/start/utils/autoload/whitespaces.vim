" Trailng spaces warning flag
let g:has_trailing_spaces = ''
function! whitespaces#trailing_spaces()
  let line = search('\s$', 'nw')
  if line != 0
    let g:has_trailing_spaces = ' !' . line
  else
    let g:has_trailing_spaces = ''
  endif
endfunction
