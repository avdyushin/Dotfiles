if !has("autocmd")
    finish
endif

augroup USER
    " Toggle relative numbers
    "autocmd InsertEnter * :set norelativenumber
    "autocmd InsertLeave * :set relativenumber

    " Update trailing space warnings
    autocmd BufEnter,BufWritePost,CursorHold * call whitespaces#trailing_spaces()
    " Update git branch name
    autocmd BufEnter,BufWritePost,FileWritePost * call git#branch_name()
    " Update git file status
    autocmd BufEnter,BufWritePost,FileWritePost * call git#file_status()
    " Unfold all blocks
    autocmd BufEnter * normal zR
    " Quick fix window
    autocmd QuickFixCmdPost * nested cwindow
    " Templates
    "autocmd BufNewFile * silent! 0r $HOME/.vim/templates/skeleton.%:e
    " Make session on buffer leave
    autocmd BufWinLeave *.* mkview
    " Load session on buffer enter
    autocmd BufWinEnter *.* silent loadview
    " Jump to the last line when reopening file
    " Better solution is to user Sessions/Views, see below
    "autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    "            \| exe "normal! g'\"" | endif
augroup END
