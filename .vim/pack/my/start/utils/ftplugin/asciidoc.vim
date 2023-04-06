" Enable spelling
setlocal spell
" Soft wrap
setlocal wrap
" Soft wrapping whole words
setlocal linebreak
" Show line breaks
setlocal showbreak=↪\ 

" Set vale compiler
try
    compiler vale
catch /.*/
endtry
