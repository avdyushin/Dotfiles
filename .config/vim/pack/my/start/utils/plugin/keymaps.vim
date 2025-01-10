" Mapping
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
" set keymap=russian-jcukenwin
cabbrev й q
cabbrev ц w
cabbrev цй wq

" -- Operator-Pending Mappings --
onoremap p i(
onoremap b i[

" -- INSERT --
" Copy vertically (pevious line)
imap <silent> <C-y> <C-r><C-r>=copy#smart_yank()<CR>

" Show next completion
inoremap <Tab> <C-r>=tabs#smart_tab()<Enter>
" Show previous completion
inoremap <S-Tab> <C-p>
" Select by pressing <Enter>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
"
" Inverse tab
"inoremap <S-Tab> <C-d>

" Show completion on Ctrl + Space
" In terminal <C-Space> gets interpreted as <C-@>
inoremap <C-@> <C-n>
" Move to the begging of line
inoremap <silent> <C-a> <C-o>^
" Move to the end of line
inoremap <silent> <C-e> <C-o>$
" Move to the next word
inoremap <silent> <C-f> <C-o>w
" Move to the previous word
inoremap <silent> <C-b> <C-o>b

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

" Autocomplete tags
"inoremap <lt>/ </<C-x><C-o><Esc>==gi

" -- NORMAL --
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
"Hard way to use hjkl for movements
nnoremap <Left>  :bp <Enter>
nnoremap <Right> :bn <Enter>
nnoremap <Up>    :N <Enter>
nnoremap <Down>  :n <Enter>

" Go to indention or go to first column
nnoremap <expr> <silent> 0 col('.') == match(getline('.'),'\S')+1 ? '0' : '^'

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
"nnoremap <Esc><Esc> :let @/ = ""<Enter>
" Clear search by temporary disabling highlight, will re highlighted on reopen
"nnoremap <Esc><Esc> :noh<Enter>
nnoremap <C-l> :let @/=""<Enter><C-l>

" Go to next split window
nnoremap <S-Tab> <C-w>w
" Go to latest changes
"nnoremap gV `[v`]
" Edit .vimrc in a right split view
nnoremap <Leader>ev :botright vsplit $MYVIMRC<Enter>
" Edit .zshrc in a right split view
nnoremap <Leader>ez :botright vsplit $ZDOTDIR/.zshrc<Enter>
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
" Execute last command again
nnoremap <Leader>. :!!<Enter>

" Git log
nmap <silent><Leader>g :call git#log_range(1)<CR>
vnoremap <silent><Leader>g :<C-u>call git#log_range(0)<CR>

" Syntax element id info popup
nmap <silent> <Leader>i :call syntax#inspect()<CR>
