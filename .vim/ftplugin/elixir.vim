setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

setlocal smartindent
setlocal autoindent
setlocal cinwords=defmodule,defmacro,def,if,else,cond,quote

setlocal comments=:#
setlocal commentstring=#\ %s

setlocal makeprg=elixir\ %
setlocal errorformat=%E**\ %*[^\ ]\ %f:%l:\ %m

imap <S-CR> <CR>end<Esc><<-o

