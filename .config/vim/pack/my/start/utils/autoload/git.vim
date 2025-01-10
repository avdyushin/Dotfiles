" Git log
let s:git_log_popup = 0
function! git#log_range(mode) range
    if a:mode
        let line_start = line(".")
        let line_end = line_start
    else
        let line_start = line("'<")
        let line_end = line("'>")
    end
    let path = shellescape(expand("%:p:h"))
    let range = line_start .. "," .. line_end
    let file = shellescape(resolve(expand("%:t")))
    let cmd = "git -C " .. path .. " log --no-merges -n 1 -L ".. range .. ":" .. file
    echo cmd
    let content = systemlist(cmd)
    call popup_close(s:git_log_popup)
    let s:git_log_popup = popup_atcursor(content, #{
                \ title: ' Git Log in ' .. range . ' ',
                \ pos: 'botleft',
                \ border: [],
                \ borderchars: g:borderchars,
                \ padding: [0,1,0,1],
                \ wrap: 0
                \ })
    call setbufvar(winbufnr(s:git_log_popup), "&filetype", "git")
endfunction

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
