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
set fillchars=fold:—,vert:·

set nowrap
set nolinebreak
set nolist
set formatoptions-=t
" let &colorcolumn="80,".join(range(120,999),",")
let &colorcolumn=join(range(120,999),",")
set foldmethod=indent

filetype plugin on
filetype indent on
syntax on
colorscheme ayu2

set t_Co=256
set t_ZH=[3m
set t_ZR=[23m
set omnifunc=syntaxcomplete#Complete

" GUI only
if has("gui_running")
  set guifont=InputMono\ ExLight:h13
  set transparency=3 "Make transparent window
endif

" Scrolling
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

set cursorline "Highlight current line

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Smart tab for completion
function! SmartTab()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-p>"
  endif
endfunction

au BufWritePost,FileWritePost * call git#branch_name()
au BufWritePost,FileWritePost * call git#file_status()
au BufEnter * normal zR

call git#branch_name()
call git#file_status()

" Status line
set laststatus=2

set statusline=
set statusline+=%f%m
set statusline+=\ %#User2#
set statusline+=%{g:git_file_status}
set statusline+=\ %=
set statusline+=%#User1#
set statusline+=%{g:git_branch_name}
set statusline+=\ %*
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
" Run menu
menu Run.Ruby :!ruby %<Enter>
menu Run.Python :!python %<Enter>

" Mapping
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

let mapleader = ","

nnoremap <Tab> w
nnoremap <S-Tab> <C-w>w
inoremap <Tab> <C-r>=SmartTab()<Enter>
inoremap <S-Tab> <C-n>

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
