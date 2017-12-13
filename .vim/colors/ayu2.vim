hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "ayu2"

hi Normal       guifg=#E6E1CF guibg=#0F1419 gui=none ctermfg=230  ctermbg=none cterm=none
hi NonText      guifg=#A6A1AF guibg=#0F1419 gui=none ctermfg=244  ctermbg=none cterm=none
hi CursorColumn guifg=NONE    guibg=#191E22 gui=none ctermfg=none ctermbg=234  cterm=none
hi CursorLine   guifg=NONE    guibg=#191E22 gui=none ctermfg=none ctermbg=234  cterm=none
hi CursorLineNr guifg=#F29718 guibg=#191E22 gui=none ctermfg=none ctermbg=234  cterm=none
hi LineNr       guifg=#2D3640 guibg=NONE    gui=none ctermfg=238
hi ColorColumn  guifg=NONE    guibg=#151A1E gui=none ctermfg=none ctermbg=none cterm=none

hi Comment      guifg=#5C6773 guibg=NONE    gui=italic ctermfg=244 cterm=italic
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
hi SpellBad     guifg=#F00000 guibg=NONE    gui=undercurl ctermfg=009 ctermbg=none cterm=undercurl

" Matched parent color
hi MatchParen   guifg=#0F1419 guibg=#B6B1BF gui=italic ctermfg=157  ctermbg=237  cterm=bold

" Completion menu
hi Pmenu        guifg=#ffffff guibg=#444444 gui=none ctermfg=255  ctermbg=238
hi PmenuSel     guifg=#000000 guibg=#B8CC52 gui=none ctermfg=0    ctermbg=148

hi Search       guifg=#0F1419 guibg=#FFEE99 gui=italic ctermfg=0    ctermbg=148
hi StatusLine   guifg=#E6E1CF guibg=#14191F gui=none ctermfg=230  ctermbg=234  cterm=none
hi StatusLineNC guifg=#2D3640 guibg=#14191F gui=none ctermfg=246  ctermbg=234  cterm=none
hi VertSplit    guifg=#2D3640 guibg=NONE    gui=none ctermfg=238  ctermbg=none cterm=none

hi Folded       guifg=#585058 guibg=#151A1E gui=none ctermfg=248  ctermbg=4
hi FoldColumn   guifg=#585058 guibg=#151A1E gui=none ctermfg=248  ctermbg=4
hi SignColumn   guifg=#2D3640 guibg=NONE    gui=none ctermfg=248  ctermbg=4
hi Title        guifg=#787078 guibg=NONE    gui=bold ctermfg=254  ctermbg=none cterm=bold
hi Visual       guifg=NONE    guibg=#253340 gui=none ctermfg=254  ctermbg=4
hi SpecialKey   guifg=#A6A1AF guibg=#0F1419 gui=none ctermfg=244  ctermbg=none cterm=none
hi Directory    guifg=#3E4B59 guibg=NONE    gui=none

hi TabLineSel   gui=bold ctermfg=148 ctermbg=232 cterm=none
hi TabLineFill  gui=bold ctermfg=0   ctermbg=232 cterm=none
hi TabLine      gui=none ctermfg=248 ctermbg=232 cterm=none

hi DiffAdd      guifg=#87af87 guibg=#0F1419 gui=reverse ctermfg=108  ctermbg=235  cterm=reverse
hi DiffChange   guifg=#8787af guibg=#0F1419 gui=reverse ctermfg=103  ctermbg=235  cterm=reverse
hi DiffDelete   guifg=#af5f5f guibg=#0F1419 gui=reverse ctermfg=131  ctermbg=235  cterm=reverse
hi DiffText     guifg=#ff8700 guibg=#0F1419 gui=reverse ctermfg=208  ctermbg=235  cterm=reverse

hi QuickFixLineNumber     guifg=#B8CC52 guibg=NONE gui=none   ctermfg=248  ctermbg=4
hi QuickFixFileName       guifg=#36A3D9 guibg=NONE gui=italic ctermfg=248  ctermbg=4
hi QuickFixSeparatorBegin guifg=#2D3640 guibg=NONE gui=none   ctermfg=248  ctermbg=4
hi QuickFixSeparatorEnd   guifg=#2D3640 guibg=NONE gui=none   ctermfg=248  ctermbg=4

hi User1        guifg=#36A3D9 guibg=#14191F gui=none    ctermfg=38   ctermbg=234  cterm=none
hi User2        guifg=#FF7733 guibg=#14191F gui=none    ctermfg=202  ctermbg=234  cterm=none
hi User3        guifg=#FF3333 guibg=NONE    gui=none    ctermfg=196  ctermbg=234  cterm=none
hi OverLength   guifg=NONE    guibg=NONE    gui=italic  ctermfg=none ctermbg=none cterm=italic

match OverLength /\%>119v.\+/
