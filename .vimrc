"
" My .vimrc
"
scriptencoding utf-8
set encoding=utf-8

set nomodeline

" Turn off Vi-compatible mode
set nocompatible
" Turn off audio bell
set visualbell
" Turn off visual bell
set belloff=all
"
set backspace=indent,eol,start

if has('clipboard')
    set clipboard=unnamed
endif

" Show line numbers
set number
" Select with mouse
"set mouse+=a
" Show line and column numbers
" set ruler
" Reload file on changes
set autoread
" Write file before :make (and other commands)
set autowrite
" Show entered command in last line
set showcmd
" Show mode (insert, visual) in last line
set showmode
" Show paired braces
set showmatch
" Timeout for mapping delays
set timeoutlen=1000
" Timeout for key code delays
set ttimeoutlen=10

" Turn off swap and backup files
set noswapfile
set nobackup
set nowb

" To replace all tabs to space in opened file, just run:
" :%retab
" Indents will have a width of 2
set shiftwidth=4
" Number of columns for a tab
set softtabstop=4
" The width of tab is 2
set tabstop=4
" Expand tabs to spaces
set expandtab
"
set autoindent
set smartindent
set smarttab

" Show tabs, trail and non-break spaces
set list

set listchars=tab:—-,trail:·,precedes:⇇,extends:⇉,nbsp:␣
set fillchars=fold:—,vert:\|

" Turn off wrap
set nowrap
set nolinebreak
set formatoptions-=t

" Turn on folding
set foldmethod=manual
" And turn off
set nofoldenable

" Turn on syntax
syntax on
filetype plugin on
filetype indent on

" Set color scheme
colorscheme ayu2

" Set 256 colors
set t_Co=256
" Setup italic in terminal
" set t_ZH=[3m
" set t_ZR=[23m
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
" Setup cursor change on insert mode
let &t_SI="\033[3 q" " start insert mode, blinking underline cursor
let &t_EI="\033[1 q" " end insert mode, blinking block

" Add color columns to make it visible
" let &colorcolumn="80,".join(range(120,999),",")
let &colorcolumn=join(range(120,999),",")

" Completion
set omnifunc=syntaxcomplete#Complete

" Scrolling
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

"Highlight current line
set cursorline

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Update trailing space warnings
au BufEnter,BufWritePost,CursorHold * call utils#trailing_spaces()
" Update git branch and status
au BufEnter,BufWritePost,FileWritePost * call utils#branch_name()
au BufEnter,BufWritePost,FileWritePost * call utils#file_status()
" Unfold all blocks
au BufEnter * normal zR
" Blink current line on focus
au FocusGained * call utils#blink_line()
" Quick fix window
au QuickFixCmdPost * nested cwindow
" Templates
au BufNewFile * silent! 0r $HOME/.vim/templates/skeleton.%:e

" Status line
set laststatus=2

set statusline=
set statusline+=%f%m
set statusline+=\ %#User2#
set statusline+=%{g:git_file_status}
set statusline+=\ %=
set statusline+=%#User1#
set statusline+=%{g:git_branch_name}
set statusline+=%*
set statusline+=%#User3#
set statusline+=%{g:has_trailing_spaces}
set statusline+=%*
" set statusline+=%2B
set statusline+=%c/%L\ %p%%

" Find path
set path=.,**
" Menus
set wildmenu
"set wildignorecase
"set wildmode=list:full

set wcm=<Tab>
" Spelling menu
menu Spelling.Disable           :setlocal nospell<Enter>
menu Spelling.English,\ Russian :setlocal spell spelllang=en,ru<Enter>
menu Spelling.Russian           :setlocal spell spelllang=ru<Enter>
menu Spelling.English           :setlocal spell spelllang=en<Enter>

source .vimrc_map
