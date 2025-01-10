" Inspect syntax
let s:inspect_toggled = 0
let s:inspect_popup = 0
function! syntax#inspect()
    if s:inspect_popup && s:inspect_toggled
        call popup_close(s:inspect_popup)
        let s:inspect_popup = 0
        let s:inspect_toggled = 0
    else
        let s:inspect_toggled = 1
        call s:set_inspect_info()
    endif
endfunction

function s:set_inspect_info()
    if s:inspect_toggled
    call popup_close(s:inspect_popup)

    let syn_id = synID(line("."), col("."), 1)
    let syn_id_trans = synID(line("."), col("."), 0)

    let name = syn_id->synIDattr("name")
    let trans = syn_id->synIDtrans()->synIDattr("name")
    let fg = syn_id->synIDtrans()->synIDattr("fg")
    let bg = syn_id->synIDtrans()->synIDattr("bg")
    let content = [
                \'name = '.name,
                \'trans = '.trans,
                \'fg = '.fg,
                \'bg = '.bg
                \]
    let s:inspect_popup = popup_create(content, #{
                \ title: ' Vim Syntax Inspect ',
                \ pos: 'topright',
                \ line: 1,
                \ col: &columns,
                \ border: [],
                \ borderchars: g:borderchars,
                \ padding: [0, 1, 0, 1],
                \ moved: [0, 0, 0]
                \ })
    call setbufvar(winbufnr(s:inspect_popup), "&filetype", "vim")
    endif
endfunction

augroup inspect
    au!
    au CursorMoved * call <SID>set_inspect_info()
augroup END
