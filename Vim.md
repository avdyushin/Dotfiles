### Add new file type detection
```sh
$ mkdir ~/.vim/ftdetect
$ echo "au BufRead,BufNewFile *.ex,*.exs set filetype=elixir" > ~/.vim/elixir.vim
```

### List recent files
```sh
:ol[dfiles]
```

To open first file in tab
```sh
:tab #<1
```

Or

```sh
:bro[wse] ol[dfiles]!
```

Then press `q` and number of file

### Reload ~/.vimrc file without restarting vim
```sh
:so ~/.vimrc
```

### Install new theme
```sh
$ mkdir ~/.vim/colors/
$ mv mustang.vim ~/.vim/colors/
```

In ~/.vimrc: `:colorscheme mustang`

### Open files in tabs
```sh
$ mvim -p file1.txt file2.txt
```

### Open file in existings window as new tab
```sh
$ mvim --remote-tab svm_author_id.py
```

### Spell
```sh
z=      : Shows suggestions for replace
```

### Navigation
```sh
42G     : Goto line

42gg    : Goto line

:42<CR> : Goto line

z.   : Scroll current line to middle

zt   : Scroll current line to top

zb   : Scroll currnet lint to bottom
```

### Editing
```sh
C-A  : Increment number under cursor

C-X  : Ddecrement number under cursor

ciw  : Changes whole word under cursor

cw   : Change the word from the currenct cursor position

r    : Replace one character

J    : Join two lines

gg=G : Indent all file
```

### Changing case
```sh
~    : Changes the case of current character

guu  : Change current line from upper to lower.

gUU  : Change current LINE from lower to upper.

guw  : Change to end of current WORD from upper to lower.

guaw : Change all of current WORD to lower.

gUw  : Change to end of current WORD from lower to upper.

gUaw : Change all of current WORD to upper.

g~~  : Invert case to entire line
```

### Page up/down
```
<C-b> : Move back one full screen
<C-f> : Move forward one full screen
<C-d> : Move down 1/2 screen
<C-u> : Move up 1/2 screen
```

### Moving over windows
Once you have multiple windows open, there are many window commands available all starting with the <C-w> key:
```
<C-w>n - :new horizontal split (editing a new empty buffer)
<C-w>s - :split window horizontally (editing current buffer)
<C-w>v - :vsplit window vertically (editing current buffer)
<C-w>c - :close window
<C-w>o - close all windows, leaving :only the current window open
<C-w>w - go to next window
<C-w>p - go to previous window
<C-w><Up> - go to window above
<C-w><Down> - go to window below
<C-w><Left> - go to window on left
<C-w><Right> - go to window on right
```
