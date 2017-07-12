" Maintainer: Avdyushin Grigory (avdyushin.g@gmail.com)
" Version: 1.0
" Last Change: 12 Jul 2017

hi clear
set background=dark

if exists("syntax_on")
  syntax reset
endif

let colors_name = "mustang2"

" Line highlight
hi CursorLine   guibg=#1d1d1d ctermbg=236 cterm=none
hi CursorLineNr guibg=#1d1d1d gui=none ctermbg=236 cterm=none 
hi CursorColumn guibg=#1d1d1d ctermbg=236
hi MatchParen   guifg=#d0ffc0 guibg=#2f2f2f gui=bold ctermfg=157 ctermbg=237 cterm=bold
hi Pmenu        guifg=#ffffff guibg=#444444 ctermfg=255 ctermbg=238
hi PmenuSel     guifg=#000000 guibg=#b1d631 ctermfg=0 ctermbg=148

" General colors
hi Cursor       guifg=NONE    guibg=#626262 gui=none ctermbg=241
hi Normal       guifg=#E6E1CF guibg=#0F1419 gui=none ctermfg=253 ctermbg=234
hi NonText      guifg=#E6E1CF guibg=#0F1419 gui=none ctermfg=244 ctermbg=235
hi LineNr       guifg=#2D3640 guibg=NONE    gui=none ctermfg=238 ctermbg=none cterm=none

" Status line
hi User1        guifg=#FFFFFF guibg=#14191F gui=none ctermfg=255 ctermbg=233 cterm=none
hi StatusLine   guifg=#E6E1CF guibg=#14191F gui=none ctermfg=230 ctermbg=233 cterm=none
hi StatusLineNC guifg=#939395 guibg=#444444 gui=none ctermfg=246 ctermbg=238

hi VertSplit    guifg=#444444 guibg=#444444 gui=none ctermfg=238 ctermbg=238
hi Folded       guibg=#384048 guifg=#a0a8b0 gui=none ctermbg=4 ctermfg=248
hi Title        guifg=#f6f3e8 guibg=NONE    gui=bold ctermfg=254 cterm=bold
hi Visual       guifg=#faf4c6 guibg=#3c414c gui=none ctermfg=254 ctermbg=4
hi SpecialKey   guifg=#808080 guibg=#343434 gui=none ctermfg=244 ctermbg=236

" Syntax highlighting
hi Comment    guifg=#808080 gui=italic ctermfg=244
hi Todo       guifg=#8f8f8f gui=italic ctermfg=245
hi Boolean    guifg=#b1d631 gui=none ctermfg=148
hi String     guifg=#b1d631 gui=italic ctermfg=148
hi Identifier guifg=#b1d631 gui=none ctermfg=148
hi Function   guifg=#ffffff gui=bold ctermfg=255
hi Type       guifg=#7e8aa2 gui=none ctermfg=103
hi Statement  guifg=#7e8aa2 gui=none ctermfg=103
hi Keyword    guifg=#ff9800 gui=none ctermfg=208
hi Constant   guifg=#ff9800 gui=none  ctermfg=208
hi Number     guifg=#ff9800 gui=none ctermfg=208
hi Special    guifg=#ff9800 gui=none ctermfg=208
hi PreProc    guifg=#faf4c6 gui=none ctermfg=230
hi Todo       guifg=#000000 guibg=#e6ea50 gui=italic
