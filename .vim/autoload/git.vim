" Git branch name
function! git#branch_name()
  let command = "cd " . expand('%:p:h') . " && git symbolic-ref --short HEAD 2>/dev/null"
  let branch = system(command)
  if empty(branch)
    let g:git_branch_name = ''
  else
    let branch = substitute(branch, '\n\+$', '', '')
    let g:git_branch_name = ' ' . branch . ''
  endif
endfunction

" Git file status
function! git#file_status()
  let file = expand('%:t')
  let command = "cd " . expand('%:p:h') . " && git status --short | grep " . file
  let modifier = substitute(system(command), '^\s*\(.\{-}\)\ ' . file . '\n\+$', '\1', '')
  if empty(modifier)
    let g:git_file_status = ''
  else
    let g:git_file_status = modifier
  endif
endfunction
