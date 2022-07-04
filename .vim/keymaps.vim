" Mapping
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
" set keymap=russian-jcukenwin
cabbrev й q
cabbrev ц w
cabbrev цй wq

" -- INSERT --

" Show next completion
"inoremap <Tab> <C-r>=utils#smart_tab()<Enter>
" Show previous completion
"inoremap <S-Tab> <C-n>
" Autocomplete tags
"inoremap <lt>/ </<C-x><C-o><Esc>==gi

" -- NORMAL --

"Hard way to use hjkl for movements
nnoremap <Left>  :bp <Enter>
nnoremap <Right> :bn <Enter>
nnoremap <Up>    :N <Enter>
nnoremap <Down>  :n <Enter>

" Make search result in the middle of the screen
nnoremap n nzz
nnoremap N Nzz
" Clear search
"nnoremap <Esc><Esc> :let @/ = ""<Enter>
nnoremap <Esc><Esc> :noh<Enter>

" Go to next split window
nnoremap <S-Tab> <C-w>w
" Go to latest changes
nnoremap gV `[v`]
" Edit .vimrc
nnoremap <Leader>ev :vsp $MYVIMRC<Enter>
" Edit .zshrc
nnoremap <Leader>ez :vsp ~/.zshrc<Enter>
" Reload .vimrc in current buffer
nnoremap <Leader>sv :source $MYVIMRC<Enter> \| :echom expand("$MYVIMRC") "has been reloaded"<Enter>
" Save and make
nnoremap <Leader>r :make<Enter>
" Wrap word with quotes
nnoremap <Leader>" mzviw<Esc>a"<Esc>bi"<Esc>`zl
" Lowercase word
nnoremap <Leader>u mzguaw`z
" Uppercase word
nnoremap <Leader>U mzgUaw`z
" Indent whole file
nnoremap <Leader>ai mzgg=G`z
" Clear search highlight on \
"nnoremap <Leader>, :noh<Enter>
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
" Most recent files
nnoremap <Leader>o :MRU<Enter>
" Execure last command again
nnoremap <Leader>. :!!<Enter>
