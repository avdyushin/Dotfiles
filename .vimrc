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

" Smart Backspace in normal mode
" If at the beginning of the line will join to previous
" else will delete character
function SmartBackspace()
    if virtcol('.') == 1
        execute "normal kJ"
    else
        execute "normal X"
    endif
endfunction

" Backspace <BS> allowance
" indent - backspacing over autoindent
" eol - backspacing over line break (join lines)
" start - backspacing over start of insert
"
" If eol is not set, join lines with: gJ command
"
"set backspace=indent,eol,start
set backspace=eol
" Delete characters with <BS>
"nnoremap <BS> X
" Move back by work with <BS>
"nnoremap <Backspace> b
nnoremap <Backspace> :call SmartBackspace()<CR>
nnoremap <S-Backspace> x

" <Enter>/<CR> behaviour
" Insert new line and return into normal mode
nnoremap <CR> o<Esc>
" Shift+Enter doesn't work in macOS Terminal out of the box
" Break current line in current position
" In GUI
"nnoremap <S-CR> i<CR><Esc>
" In terminal: ^M = Ctrl+V + Shift+Enter
"nnoremap  i<CR><Esc>

" Jump to the last line when reopening file
" Better solution is to user Sessions/Views, see below
"if has("autocmd")
"    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"                \| exe "normal! g'\"" | endif
"endif

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
" Don't create backup before writing, this option overridden by backup below
"set nowritebackup
" Turn on swap files
" To avoid creating too much swap files open them in read-only mode:
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
" By default undo reverts everything since entering insert mode
inoremap <Enter> <Enter><C-g>u
inoremap . .<C-g>u
inoremap , ,<C-g>u
inoremap ; ;<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap <C-w> <C-g>u<C-w>
inoremap <C-u> <C-g>u<C-u>

" Reload file on changes
set autoread
" Write file before :make (and other commands or quit)
set autowriteall

" Automatic sessions
" Will open last position when reopening files
" Specify where session scripts are stored
set viewdir=$HOME/.vim/tmp//
" This is important to have modeline work together with view sessions
set viewoptions-=options
set sessionoptions-=options
" Make session on buffer leave
au BufWinLeave *.* mkview
" Load session on buffer enter
au BufWinEnter *.* silent loadview

" Split behaviour
" sp <filename> will open in bottom view
set splitbelow
" vsp <filename> will open in right view
set splitright

" Reload configuration on .vimrc save
au! BufWritePost $MYVIMRC source %

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

" Toggle wrapping with line breaks
function ToggleWrapping()
    if &wrap == 0
        " Turn on wrap
        setlocal wrap
        " Break lines by words
        setlocal linebreak
    else
        " Turn off wrap
        setlocal nowrap
        " Break lines by character
        setlocal nolinebreak
    endif
    echo 'Wrapping had been ' . (&wrap ? 'enabled' : 'disabled')
endfunction

" Wrap mode helpers

" Go to the next character visually below current one
nnoremap <expr> j v:count ? 'j' : 'gj'
" Go to the next character visually above current one
nnoremap <expr> k v:count ? 'k' : 'gk'
" Keymap to toggle wrapping
nnoremap <Leader>w :call ToggleWrapping()<CR>

" Search for trailing whitespaces
nnoremap <Leader>ws :/\s$<Enter>

" Spelling
" ]s - next misspelled word
" [s - previous misspelled word
" z= - show suggestions
" zg - add word as 'good' into spellfile
" zw - add word as 'wrong' into spellfile

function ToggleSpelling()
    if &spell == 0
        setlocal spell
    else
        setlocal nospell
    endif
    call LogSpelling()
endfunction

function SetSpelling(...)
    setlocal spell
    setlocal spelllang=
    " Same as execute 'setlocal spelllang+=' . join(a:000, ',')
    let &l:spelllang .= join(a:000, ',')
    call LogSpelling()
endfunction

function LogSpelling()
    echo 'Spelling ' . &spelllang . ' has been ' . (&spell == 1 ? 'enabled' : 'disabled')
endfunction

"set spell
" Off by default
set nospell
set spellfile=./user.utf-8.add

" Spelling menu
menu Spelling.Toggle  :call ToggleSpelling()<CR>
menu Spelling.English :call SetSpelling('en')<CR>
menu Spelling.Russian :call SetSpelling('ru')<CR>
menu Spelling.Dutch   :call SetSpelling('nl')<CR>
menu Spelling.All     :call SetSpelling('en', 'ru', 'nl')<CR>

" Spelling menu key binding
nnoremap <Leader>s :emenu Spelling.<Tab><Tab>
nnoremap <Leader>sp :call ToggleSpelling(langs)<CR>

" Modelines
set modeline

" Do not auto-wrap text
set formatoptions-=t
" Delete comment character when joining commented lines
set formatoptions+=j
" Insert comment character after adding new empty line below or above
" o or O commands in normal mode
set formatoptions+=o

" Folding
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

" Menus, cycle through using <Tab> and <S-Tab>
" Allow <Left> and <Right> to navigate through the completion lists
set wildmenu
" First <Tab> will complete to the longest common string and will show menu
" Second <Tab> it will complete the first alternative
set wildmode=longest:full,full
set wildignorecase
set wildchar=<Tab>
set wildcharm=<Tab>

if filereadable(expand("$HOME/.vim/keymaps.vim"))
    source $HOME/.vim/keymaps.vim
endif

if filereadable(expand('$HOME/.vimrc_local'))
    source $HOME/.vimrc_local
endif
