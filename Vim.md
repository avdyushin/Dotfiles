# Vim easy usage

## Opening files in tabs
* `mvim -p sd_done.py prepare.py` open in tabs
* `mvim --remote-tab svm_author_id.py` open file in existing editor as tab

## Navigation

### Jumping on lines
* `G` go to *last* line
* `gg` go to *first* line
* `42G` go to line number 42
* `42gg` go to line the same number line 42
* `:42<CR>` use command to go to line 42
* `5j` go to 5 lines down
* `7k` go to 7 lines up
* `2}` jump to next 2 paragraphs
* `3{` jump to previous 3 paragraphs

### Spelling mode
* `]s` go to next misspelled word
* `[s` go to previous misspelled word
* `z=` shows suggestions for replace

### Jumping on words and symbols
* `2l` go to in 2 symbols forward
* `7h` go to in 7 symbols back
* `3w` go to in 3 words forward
* `4b` go to in 4 words back
* `e` go to the end of current word
* `^` go to the beginning of line
* `$` go to the end of line

### Moving on screen
* `<C-b>` move back one full screen
* `<C-f>` move forward one full screen
* `<C-d>` move down 1/2 screen
* `<C-u>` move up 1/2 screen

### Positioning on screen
* `z.` scroll current line to middle
* `zt` scroll current line to top
* `zb` scroll current lint to bottom

### Moving over windows
* `<C-w>n` :new horizontal split (editing a new empty buffer)
* `<C-w>s` :split window horizontally (editing current buffer)
* `<C-w>v` :vsplit window vertically (editing current buffer)
* `<C-w>c` :close window
* `<C-w>o` close all windows, leaving :only the current window open
* `<C-w>w` go to next window
* `<C-w>p` go to previous window
* `<C-w><Up>` go to window above
* `<C-w><Down>` go to window below
* `<C-w><Left>` go to window on left
* `<C-w><Right>` go to window on right

## Editing

### General
* `<C-a>` increment number under cursor
* `<C-x>` decrement number under cursor
* `ciw` change whole word under cursor
* `cw` change the word from the current cursor position
* `r` replace one character
* `xp` swap two symbols (cut and past to next)
* `gg=G` indent all file
* `J` join two lines

### Changing case
* `~` changes the case of current character
* `guu` change current line from upper to lower.
* `gUU` change current line from lower to upper.
* `guw` change to end of current word from upper to lower.
* `guaw` change all of current word to lower.
* `gUw` change to end of current word from lower to upper.
* `gUaw` change all of current word to upper.
* `g~~` invert case to entire line

## Add-ons

### Add new file type detection
```sh
$ mkdir ~/.vim/ftdetect
$ echo "au BufRead,BufNewFile *.ex,*.exs set filetype=elixir" > ~/.vim/elixir.vim
```

### Reload `~/.vimrc` file without restarting vim
```sh
:so ~/.vimrc
```

### Install new color theme
```sh
$ mkdir ~/.vim/colors/
$ mv mustang.vim ~/.vim/colors/
```

### Show recently used files
* `:oldfiles` or `:browse oldfiles`
