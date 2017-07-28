if has("gui_running")
  " Set font
  set guifont=InputMono\ ExLight:h13
  " Make transparent window
  set transparency=3
endif

" MacVim only
if has("gui_macvim")
  " Hide scrollbars
  set guioptions-=r
  set guioptions-=l
endif
