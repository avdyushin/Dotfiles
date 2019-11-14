au BufRead,BufNewFile *.go set filetype=go
au FileType go au BufWritePost <buffer> silent !gofmt -w %
