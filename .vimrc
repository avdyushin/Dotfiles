"
" My .vimrc
"
" Reload .vimrc :source $MYVIMRC
"

" Set encoding
scriptencoding utf-8
set encoding=utf-8
" Disable mode lines for security reasons
set nomodeline
" Turn off Vi-compatible mode
set nocompatible
" Turn off audio bell
set visualbell
" Turn off visual bell
set belloff=all

" Set <Leader> for commands
let mapleader = ","

" Backspace <BS> allowance
" indent - backspacing over autoindent
" oel - backspacing over line break (join lines)
" start - backspacing over start of insert
"
" If oel is not set, join lines with: gJ command
"
"set backspace=indent,eol,start
set backspace=
" Delete characters with <BS>
"nnoremap <BS> X
" Move back by work with <BS>
nnoremap <BS> b

" Jump to the last line when reopening file
"if has("autocmd")
"    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"                \| exe "normal! g'\"" | endif
"endif

" Automatic sessions
" Will open last posisiton when reopenning files
" Specify where session scripts are stored
set viewdir=$HOME/.vim/tmp//
" Make session on buffer leave
au BufWinLeave *.* mkview
" Load session on buffer enter
au BufWinEnter *.* silent loadview

if has('clipboard')
    set clipboard=unnamed
endif

" Show line numbers
" To hide line numbers use command: set nonumber / set nonu
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

" Turn off swap files
"set noswapfile
" Immediately delete backup files
"set nobackup
" Don't create backup before writing, this option overriden by backup below
"set nowritebackup

" Turn on swap files
" To avoid creaing too much swap files open them in read-only mode:
" vim -R <file>, or view <file>
set swapfile
" Keep all swap files in one place
set directory^=$HOME/.vim/tmp//
" Create backup before writing and keep backup files (will be overwritten on future backups)
set backup
" Keep all backups in given place
set backupdir^=$HOME/.vim/tmp//

" Persistent undo across sessions
set undofile
set undodir^=$HOME/.vim/tmp//
" Undo points
" By default undo reverts everything since entering intert mode
inoremap <Enter> <Enter><C-g>u
inoremap . .<C-g>u
inoremap , ,<C-g>u
inoremap ; ;<C-g>u
inoremap ! !<C-g>U
inoremap ? ?<C-g>U

" Split behaviour
" sp <filename> will open in bottom view
set splitbelow
" vsp <filename> will open in right view
set splitright

" To replace all tabs to spaces in the opened file, just run:
" :%retab
" Indents will have a width of 2
set shiftwidth=4
" Number of columns for a tab
set softtabstop=4
" The width of tab is 4
set tabstop=4
" Expand tabs to spaces
set expandtab
"
set autoindent
set smartindent
set smarttab

" Show tabs, trail and non-break spaces
set list

set listchars=tab:—-,trail:·,precedes:⇇,extends:⇉,nbsp:␣,eol:¬
set fillchars=fold:—,vert:\|

function WrappingDisable()
    " Turn off wrap
    set nowrap
    " Break lines by character
    set nolinebreak
    unmap j
    unmap k
endfunction

function WrappingEnable()
    " Turn on wrap
    set wrap
    " Break lines by words
    set linebreak
    " Go to the next character visually below current one
    nnoremap <expr> j v:count ? 'j' : 'gj'
    " Go to the next character visually above current one
    nnoremap <expr> k v:count ? 'k' : 'gk'
endfunction

menu Wrapping.Enable  :call WrappingEnable()<Enter>
menu Wrapping.Disable :call WrappingDisable()<Enter>

call WrappingEnable()

nnoremap <Leader>ws :/\s$<Enter>
nnoremap <Leader>w :emenu Wrap.<Tab>

" Spelling
" ]s - next misspelled word
" [s - previous misspelled word
" z= - show suggestions
"set spell
" Off by default
set nospell
" Spelling menu
menu Spelling.Enable  :setlocal spell spelllang=en,nl,ru<Enter>
menu Spelling.Disable :setlocal nospell<Enter>
menu Spelling.Russian :setlocal spell spelllang=ru<Enter>
menu Spelling.English :setlocal spell spelllang=en<Enter>
menu Spelling.Dutch   :setlocal spell spelllang=nl<Enter>
" Spelling menu key binding
nnoremap <Leader>s :emenu Spelling.<Tab>

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
"let &colorcolumn="80,".join(range(120,999),",")
"let &colorcolumn=join(range(120,999),",")

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
"au FocusGained * call utils#blink_line()
" Quick fix window
au QuickFixCmdPost * nested cwindow
" Templates
"au BufNewFile * silent! 0r $HOME/.vim/templates/skeleton.%:e

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
" set statusline+=%2B
set statusline+=%c/%L\ %p%%
set statusline+=%*
set statusline+=%#User3#
set statusline+=%{g:has_trailing_spaces}

" Find path
set path=.,**
" Menus
set wildmenu
set wildignorecase
" Menu suggestions / completion
set wildmode=longest:full

set wcm=<Tab>

if filereadable(expand("$HOME/.vim/keymaps.vim"))
    source $HOME/.vim/keymaps.vim
endif
