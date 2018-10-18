" Set font
set guifont=InputMonoNarrow\ ExLight:h14
" Make transparent window
set transparency=5

" MacVim only
if has("gui_macvim")
  " Hide scrollbars
  set guioptions-=R
  set guioptions-=L
  set guioptions-=r
  set guioptions-=l
endif
