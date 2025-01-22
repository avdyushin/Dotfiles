if exists("current_complier")
    finish
endif

let current_complier = "shell"

CompilerSet makeprg=/bin/sh\ %
CompilerSet errorformat=%f:\ line\ %l:\ %m
