" Git branch name
let g:git_branch_name = ''
function! git#branch_name()
    let command = "cd \"" . expand('%:p:h') . "\" && git symbolic-ref --short HEAD 2>/dev/null"
    " Use last part if branch name separated by '/'
    let branch = system(command . " | awk -F'/' '{printf \"%s\", $NF}'")
    if empty(branch)
        let g:git_branch_name = ''
    else
        let branch = substitute(branch, '\n\+$', '', '')
        let g:git_branch_name = ' ' . branch . ' '
    endif
endfunction

" Git file status
let g:git_file_status = ''
function! git#file_status()
    if empty(g:git_branch_name)
        let g:git_file_status = ''
        return
    endif
    let file = expand('%:t')
    if empty(file)
        let g:git_file_status = ''
        return
    endif
    let command = "cd \"" . expand('%:p:h') . "\" && git status --short 2>/dev/null"
    " Extract file status flag
    let modifier = system(command . " | grep '" . file . "$' | awk -F' ' '{printf \"%s\", $1}'")
    if empty(modifier)
        let g:git_file_status = ''
    else
        let g:git_file_status = modifier
    endif
endfunction
