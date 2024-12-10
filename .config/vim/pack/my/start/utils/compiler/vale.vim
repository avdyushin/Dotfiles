if exists("current_complier")
    finish
endif

let current_complier = "vale"

CompilerSet makeprg=vale\ --no-wrap\ --output\ line\ %
CompilerSet errorformat=%f:%l:%c:%m
