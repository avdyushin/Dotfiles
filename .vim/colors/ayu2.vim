hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "ayu2"

hi Normal       guifg=#E6E1CF guibg=#0F1419 gui=none ctermfg=230  ctermbg=none cterm=none
hi NonText      guifg=#A6A1AF guibg=#0F1419 gui=none ctermfg=244  ctermbg=235  cterm=none
hi CursorColumn guifg=NONE    guibg=#151A1E gui=none ctermfg=none ctermbg=234  cterm=none
hi CursorLine   guifg=NONE    guibg=#151A1E gui=none ctermfg=none ctermbg=234  cterm=none
hi CursorLineNr guifg=#F29718 guibg=#151A1E gui=none ctermfg=none ctermbg=234  cterm=none
hi LineNr       guifg=#3D3A44 guibg=NONE    gui=none ctermfg=238
hi ColorColumn  guifg=NONE    guibg=#151A1E gui=none ctermfg=none ctermbg=none cterm=none

hi Comment      guifg=#5C6773 guibg=NONE    gui=none ctermfg=244
hi Constant     guifg=#FFEE99 guibg=NONE    gui=none ctermfg=221
hi String       guifg=#B8CC52 guibg=NONE    gui=none ctermfg=148
hi Identifier   guifg=#36A3D9 guibg=NONE    gui=none ctermfg=148
hi Function     guifg=#FFB454 guibg=NONE    gui=none ctermfg=214
hi Statement    guifg=#FF7733 guibg=NONE    gui=none ctermfg=208
hi Operator     guifg=#E7C547 guibg=NONE    gui=none ctermfg=214
hi PreProc      guifg=#E6B673 guibg=NONE    gui=none ctermfg=222
hi Type         guifg=#36A3D8 guibg=NONE    gui=none ctermfg=45
hi Structure    guifg=#E6B673 guibg=NONE    gui=none ctermfg=208
hi Keyword      guifg=#E6B673 guibg=NONE    gui=none ctermfg=45
hi Special      guifg=#E6B673 guibg=NONE    gui=none ctermfg=208
hi Undefined    guifg=#36A3D9 guibg=NONE    gui=none ctermfg=208
hi Todo         guifg=#F07178 guibg=NONE    gui=none ctermfg=211  ctermbg=0    cterm=none

" Matched parent color
hi MatchParen   guifg=#0F1419 guibg=#E6E1CF gui=bold ctermfg=157  ctermbg=237  cterm=bold

" Completion menu
hi Pmenu        guifg=#ffffff guibg=#444444 gui=none ctermfg=255  ctermbg=238
hi PmenuSel     guifg=#000000 guibg=#B8CC52 gui=none ctermfg=0    ctermbg=148

hi Search       guifg=#0F1419 guibg=#B8CC52 gui=none ctermfg=0    ctermbg=148
hi StatusLine   guifg=#E6E1CF guibg=#14191F gui=none ctermfg=230  ctermbg=232  cterm=none
hi StatusLineNC guifg=#3D3A44 guibg=#14191F gui=none ctermfg=246  ctermbg=232  cterm=none
hi VertSplit    guifg=NONE    guibg=NONE    gui=none ctermfg=238  ctermbg=238

hi Folded       guifg=#585058 guibg=#151A1E gui=none ctermfg=248  ctermbg=4
hi Title        guifg=#f6f3e8 guibg=NONE    gui=bold ctermfg=254  ctermbg=none cterm=bold
hi Visual       guifg=NONE    guibg=#253340 gui=none ctermfg=254  ctermbg=4
hi SpecialKey   guifg=#808080 guibg=#343434 gui=none ctermfg=244  ctermbg=236

hi TabLineSel   ctermfg=148 ctermbg=232 cterm=none
hi TabLineFill  ctermfg=0   ctermbg=232 cterm=none
hi TabLine      ctermfg=248 ctermbg=232 cterm=none

hi User1        guifg=#36A3D9 guibg=#14191F gui=none ctermfg=38   ctermbg=232  cterm=none
hi User2        guifg=#FF7733 guibg=#14191F gui=none ctermfg=202  ctermbg=232  cterm=none
hi OverLength   guifg=#F07178 guibg=NONE    gui=none ctermfg=211  ctermbg=none cterm=none

match OverLength /\%>80v.\+/
