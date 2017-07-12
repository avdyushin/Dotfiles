set nocompatible
set backspace=indent,eol,start

set number
set ruler
set autoread
set showcmd
set showmode

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
set listchars=tab:>-,trail:·,extends:\#,nbsp:·

set wrap
set linebreak
set nolist
set textwidth=79

set t_Co=256
colorscheme mustang2
filetype plugin on
filetype indent on
syntax on

set cul "Highlight current line

" GUI only
if has("gui_running")
  set guifont=Input\ Mono\ Narrow:h13
  set transparency=8 "Make transparent window
endif

" Scrolling
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

" Search
set incsearch
set hlsearch
set is

" Status line
set laststatus=2
set statusline=%f%m\ %=%c,%l/%L\ %4p%%

" Menus
set wildmenu

set wcm=<Tab>
" Spelling menu
menu Spelling.Disable           :setlocal nospell<Enter>
menu Spelling.English,\ Russian :setlocal spell spelllang=en,ru<Enter>
menu Spelling.Russian           :setlocal spell spelllang=ru<Enter>
menu Spelling.English           :setlocal spell spelllang=en<Enter>
" Run menu
menu Run.Ruby :!ruby %<Enter>
menu Run.Python :!python %<Enter>

" Mapping
"
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

let mapleader = ","

nnoremap B ^
nnoremap E $
nnoremap gV `[v`]

nnoremap <leader>ev :vsp $MYVIMRC<Enter>
nnoremap <leader>ez :vsp ~/.zshrc<Enter>
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

nnoremap <silent> <C-Left> b
nnoremap <silent> <C-Right> w
nnoremap <silent> <C-a> ^
nnoremap <silent> <C-e> $

" Move line up
nnoremap <S-Up> :m .-2<Enter>==
" Move line down
nnoremap <S-Down> :m .+1<Enter>==
