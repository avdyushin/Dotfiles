if !exists("g:python_command")
  let g:python_command = "python"
endif

function! Error(message)
  echohl ErrorMsg
  echomsg "JSON: " . a:message
  echohl None
endfunction

function! DoValidate()
  let command = g:python_command . " -m json.tool " . expand('%:p')
  let result = system(command)
  for line in split(result, '\n')
    if line =~ '\v^Expecting\s+'
      call Error(line)
      return 0
    elseif line =~ '\v^No\s+JSON\s+object'
      call Error(line)
      return 0
    elseif line =~ '\v^Invalid\s+'
      call Error(line)
      return 0
    elseif line =~ '\v^Extra\s+'
      call Error(line)
      return 0
    endif
  endfor
  return 1
endfunction

function! Validate()
  if DoValidate()
    echo "Valid JSON"
  endif
endfunction

function! PrettyFormat()
  if !DoValidate()
    return
  endif
  let line = line('.')
  execute "%!" . g:python_command . " -m json.tool 2>/dev/null"
  execute line
endfunction

let maplocalleader = ","
nnoremap <buffer> <localleader>f :call PrettyFormat()<Enter>
nnoremap <buffer> <localleader>v :call Validate()<Enter>
