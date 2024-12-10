" Mapping
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
" set keymap=russian-jcukenwin
cabbrev й q
cabbrev ц w
cabbrev цй wq

" -- INSERT --
" Show next completion
inoremap <Tab> <C-r>=tabs#smart_tab()<Enter>
" Show previous completion
inoremap <S-Tab> <C-p>
" Select by pressing <Enter>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Inverse tab
"inoremap <S-Tab> <C-d>

" Show completion on Ctrl + Space
" In terminal <C-Space> gets interpreted as <C-@>
inoremap <C-@> <C-n>

" Autocomplete tags
"inoremap <lt>/ </<C-x><C-o><Esc>==gi

" -- NORMAL --

"Hard way to use hjkl for movements
nnoremap <Left>  :bp <Enter>
nnoremap <Right> :bn <Enter>
nnoremap <Up>    :N <Enter>
nnoremap <Down>  :n <Enter>

" Search for string under cursor: * forward and # backward
" /TERM to search
" n - go to next result
" N - go to previous result
" q/ - recent searches
" /<Enter> - repeat search
" ?<Enter> - repeat backwards
" :g
" Make search result in the middle of the screen
nnoremap n nzz
nnoremap N Nzz
" Clear search by clearing latest buffer
nnoremap <Esc><Esc> :let @/ = ""<Enter>
" Clear search by temporary disabling highlight, will re highlighted on reopen
"nnoremap <Esc><Esc> :noh<Enter>

" Go to next split window
nnoremap <S-Tab> <C-w>w
" Go to latest changes
"nnoremap gV `[v`]
" Edit .vimrc in a right split view
nnoremap <Leader>ev :botright vsplit $MYVIMRC<Enter>
" Edit .zshrc in a right split view
nnoremap <Leader>ez :botright vsplit $HOME/.zshrc<Enter>
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
"nnoremap <silent> <C-Left> b
" Move one work forward
"nnoremap <silent> <C-Right> w
" Do not remap <Tab> in order to have <C-i> working!
"nnoremap <Tab> w
" Move to the begging of line
nnoremap <silent> <C-a> ^
nnoremap B ^
" Move to the end of line
nnoremap <silent> <C-e> $
nnoremap E $
" Move line up
nnoremap <Leader>K :m .-2<Enter>==
" Move line down
nnoremap <Leader>J :m .+1<Enter>==
" Move visually selected lines up
vnoremap <Leader>K :m '<-2<Enter>gv=gv
" Move visually selected lines down
vnoremap <Leader>J :m '>+1<Enter>gv=gv
" Execure last command again
nnoremap <Leader>. :!!<Enter>
