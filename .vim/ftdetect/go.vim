function! s:GoFormat()
    let b:view = winsaveview()
    silent execute "%!gofmt"

    if v:shell_error

        let b:errors = []

        for line in getline(1, line('$'))
            let tokens = matchlist(line, '^\(.\{-}\):\(\d\+\):\(\d\+\)\s*\(.*\)')
            if !empty(tokens)
                call add(b:errors, {"filename": @%,
                                   \"lnum":     tokens[2],
                                   \"col":      tokens[3],
                                   \"text":     tokens[4]})
            endif
        endfor

        if empty(b:errors)
            echohl Error | echomsg "GoFmt returned unkonwn error" | echohl None
        endif

        " Undo changes in case of errors
        undo

        if !empty(b:errors)
            call setloclist(0, b:errors, 'r')
        endif
        echohl Error | echomsg "GoFmt returned an error" | echohl None
    endif

    call winrestview(b:view)
endfunction

command! -buffer Fmt call s:GoFormat()

au BufRead,BufNewFile *.go set filetype=go
au FileType go au BufWritePre <buffer> Fmt
