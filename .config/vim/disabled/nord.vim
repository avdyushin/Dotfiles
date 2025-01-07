" Set color scheme
let g:nord_cursor_line_number_background = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
augroup nord-theme-overrides
  autocmd!
  " Use 'nord7' as foreground color for Special.
  autocmd ColorScheme nord highlight Special ctermfg=14 guifg=#8FBCBB
augroup END
colorscheme nord
