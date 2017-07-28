" Git branch name
let g:git_branch_name = ''
function! utils#branch_name()
  let command = "cd " . expand('%:p:h') . " && git symbolic-ref --short HEAD 2>/dev/null"
  let branch = system(command)
  if empty(branch)
    let g:git_branch_name = ''
  else
    let branch = substitute(branch, '\n\+$', '', '')
    let g:git_branch_name = ' ' . branch . ' '
  endif
endfunction

" Git file status
let g:git_file_status = ''
function! utils#file_status()
  let file = expand('%:t')
  let command = "cd " . expand('%:p:h') . " && git status --short 2>/dev/null | grep -F '" . file . "'"
  let modifier = substitute(system(command), '^\s*\(.\{-}\)\ ' . file . '\n\+$', '\1', '')
  if empty(modifier)
    let g:git_file_status = ''
  else
    let g:git_file_status = modifier
  endif
endfunction

" Smart tab for completion
function! utils#smart_tab()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-p>"
  endif
endfunction

" Trailng spaces warning flag
let g:has_trailing_spaces = ''
function! utils#trailing_spaces()
  let line = search('\s$', 'nw')
  if line != 0
    let g:has_trailing_spaces = '·' . line . ' '
  else
    let g:has_trailing_spaces = ''
  endif
endfunction