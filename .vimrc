set nocompatible
set backspace=indent,eol,start

" Show line numbers
set number
set ruler
" Reload file on changes
set autoread
set showcmd
set showmode

" Turn off swap and backup files
set noswapfile
set nobackup
set nowb

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Show tabs, trail and non-break spaces
set list
set listchars=tab:>-,trail:·,precedes:⇇,extends:⇉,nbsp:␣
set fillchars=fold:—,vert:│

set nowrap
set nolinebreak
set formatoptions-=t
" let &colorcolumn="80,".join(range(120,999),",")
let &colorcolumn=join(range(120,999),",")
set foldmethod=indent

" Turn on stynax
syntax on
filetype plugin on
filetype indent on

" Set color scheme
colorscheme ayu2

" Set 256 colors
set t_Co=256
" Setup italic in terminal
set t_ZH=[3m
set t_ZR=[23m
" Setup cursor change on insert mode
let &t_SI="\033[3 q" " start insert mode, blinking underline cursor
let &t_EI="\033[1 q" " end insert mode, blinking block

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
au FocusGained * call utils#blink_line()
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

" Menus
set wildmenu

set wcm=<Tab>
" Spelling menu
menu Spelling.Disable           :setlocal nospell<Enter>
menu Spelling.English,\ Russian :setlocal spell spelllang=en,ru<Enter>
menu Spelling.Russian           :setlocal spell spelllang=ru<Enter>
menu Spelling.English           :setlocal spell spelllang=en<Enter>

" Mapping
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" Set leader for commands
let mapleader = ","

" Hard way to use hjkl for movements
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

" Goto next splitted window
nnoremap <S-Tab> <C-w>w
" Show next completion
inoremap <Tab> <C-r>=utils#smart_tab()<Enter>
" Show previouse completion
inoremap <S-Tab> <C-n>
" Goto lastes changes
nnoremap gV `[v`]
" Edit .vimrc
nnoremap <leader>ev :vsp $MYVIMRC<Enter>
" Edit .zshrc
nnoremap <leader>ez :vsp ~/.zshrc<Enter>
" Reload .vimrc in current buffer
nnoremap <leader>sv :source $MYVIMRC<Enter>
" Wrap word with quotes
nnoremap <leader>" mzviw<Esc>a"<Esc>bi"<Esc>`zl
" Lowercase word
nnoremap <leader>u mzguaw`z
" Uppercase word
nnoremap <leader>U mzgUaw`z
" Indent whole file
nnoremap <leader>ai mzgg=G`z
" Clear search highlight on \
nnoremap <leader>, :noh<Enter>
" Run menu
nnoremap <leader>r :emenu Run.<Tab>
" Spelling menu
nnoremap <leader>s :emenu Spelling.<Tab>
" Move one word back
nnoremap <silent> <C-Left> b
" Move one work forward
nnoremap <silent> <C-Right> w
nnoremap <Tab> w
" Move to the begging of line
nnoremap <silent> <C-a> ^
nnoremap B ^
" Move to the end of line
nnoremap <silent> <C-e> $
nnoremap E $
" Move line up
nnoremap K :m .-2<Enter>==
" Move line down
nnoremap J :m .+1<Enter>==
" Move visually selected lines up
vnoremap K :m '<-2<Enter>gv=gv
" Move visually selected lines down
vnoremap J :m '>+1<Enter>gv=gv
