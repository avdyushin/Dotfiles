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
nnoremap <Backspace> :call backspace#smart_backspace()<CR>
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

" Split behaviour
" sp <filename> will open in bottom view
set splitbelow
" vsp <filename> will open in right view
set splitright

" Reload configuration on .vimrc save
"au! BufWritePost $MYVIMRC source %

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

" Wrap mode helpers

" Go to next/prev line using h and l
set whichwrap+=<,>,h,l

" Go to the next character visually below current one
nnoremap <expr> j v:count ? 'j' : 'gj'
" Go to the next character visually above current one
nnoremap <expr> k v:count ? 'k' : 'gk'
" Keymap to toggle wrapping
nnoremap <Leader>w :call wrapping#toggle()<CR>
" Simulate soft wrap at 80
nnoremap <Leader>v :vnew \| wincmd p \| vertical res 80<CR>

" Search for trailing whitespaces
nnoremap <Leader>ws :/\s$<Enter>

if has("spell")
    " Spelling
    set nospell
    set spellfile=./user.utf-8.add

    " Spelling menu
    menu Spelling.Toggle  :call spelling#toggle()<CR>
    menu Spelling.English :call spelling#set('en')<CR>
    menu Spelling.Russian :call spelling#set('ru')<CR>
    menu Spelling.Dutch   :call spelling#set('nl')<CR>
    menu Spelling.All     :call spelling#set('en', 'ru', 'nl')<CR>

    " Spelling menu key binding
    nnoremap <Leader>s :emenu Spelling.<Tab><Tab>
endif

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
if has("folding")
    " Turn on folding
    set foldmethod=manual
    " And turn off
    set nofoldenable
endif

" Turn on syntax
if has("syntax")
    syntax enable
endif

filetype plugin on
filetype indent on

" Set color scheme
colorscheme ayu

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
" <C-x><C-o>
set omnifunc=syntaxcomplete#Complete

" File/path completion
" <C-x><C-f>

" Completion options
" longets - completes to longest commont
" menuone - shows menu even with one item
" noinsert - no insert word
set completeopt=menuone

" Words
" <C-x><C-k>
if filereadable("/usr/share/dict/words")
    set dictionary+=/usr/share/dict/words
endif

" Copy vertically (pevious line)
imap <silent> <C-y> <C-r><C-r>=copy#smart_yank()<CR>

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

function Spellline()
    if &spell
        return " " . toupper(&spelllang)
    else
        return ""
    endif
endfunction

function Wrapline()
    if &wrap
        return " W"
    else
        return ""
    endif
endfunction

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
set statusline+=%{Wrapline()}
set statusline+=%{Spellline()}
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
