# How to use Vim

#### Editing commands
| Text object | Change | Delete | Copy |
| :---        | :---   | :---   | :--- |
| One word | `cw` | `dw` | `yw` |
| Given number of words, without punctuation | `2cW` | `2dW` | `2yW` |
| Given number of words back | `3cb` | `3db` | `3yb` |
| One line | `cc` | `dd` | `yy`, `Y` |
| To end of line | `c$`, `C` | `d$`, `D` | `y$` |
| To beginning of line | `c0` | `d0` | `y0` |
| Single character | `r` | `x`, `X` | `yl`, `yh` |
| Given number of characters | `5s` | `5x` | `5yl` |

#### Editing commands
| Editing action | Command |
| :---           | :---    |
| Swap two characters | `xp` |
| Change whole word under cursor | `ciw` |
| Change text inside brackets | `ci(`, `ci[` |

#### Movement
| Movement | Command |
| :---     | :---    |
| To first line | `gg` |
| To last line | `G` |
| To given line number | `13G`, `24gg`, `:56` |
| To first character of next line | `+` |
| To first character of previous line | `-` |
| To end of word | `e`, `2e` |
| Forward by word | `w`, `3w` |
| Backward by word | `b`, `4b` |
| To end of line | `$` |
| To beginning of line | `^`, `0` |
| Next line | `j`, `5j` |
| Previous line | `k`, `6k` |
| Forward by character | `l`, `4l` |
| Backward by character | `h`, `3h` |
| Next paragraphs | `}`, `2}` |
| Previous paragraph | `{`, `3{` |
| Next function | `]]` |
| Previous function | `[[` |

#### Text creation and manipulation commands
| Editing action | Command |
| :---           | :---    |
| Insert text at current position | `i` |
| Insert text at beginning of line | `I` |
| Append text at current position | `a` |
| Append text at end of line | `A` |
| Open new line below cursor for new text | `o` |
| Open new line above cursor for new text | `O` |
| Delete line and substitute text | `S` |
| Over strike existing characters with new text | `R` |
| Toggle case | `~` |
| Repeat last action | `.` |
| Undo last change | `u` |
| Restore line to original state | `U` |
| Indent whole file | `gg=G` |

#### Changing case commands
| Change case action | Command |
| :---               | :---    |
| Current character | `~` |
| Current line from upper to lower | `guu` |
| Current line from lower to upper | `gUU` |
| To end of current word from upper to lower | `guw` |
| To end of current word from lower to upper | `gUw` |
| All of current word to lower | `guaw` |
| All of current word to upper | `gUaw` |
| Invert case to entire line | `g~~` |

#### Text spelling
| Spelling action | Command |
| :---            | :---    |
| Enable spell check for current file | `:setlocal spell spelllang=en,ru` |
| Disable spell check for current file | `:setlocal nospell`
| Go to next misspelled word | `]s` |
| Go to previous misspelled word | `[s` |
| Show suggestions for word under cursor | `z=` |

#### Moving over file
| Move action | Command |
| :---        | :---    |
| Back one full screen | `<C-b>` |
| Forward one full screen | `<C-f>` |
| Down 1/2 screen | `<C-d>` |
| Up 1/2 screen | `<C-u>` |

#### Positioning on screen
| Position action | Command |
| :---            | :---    |
| Current line to middle | `z.` |
| Current line to top | `zt` |
| Current lint to bottom | `zb` |

#### Visual mode
| Visual selection actions | Command |
| :---                     | :---    |
| Select word | `iw`, `iW` |
| Select paragraph | `ip`, `ap` |
| Select block between pair symbols | `i{`, `i(`, `i<` |
| Enter column insert mode | `Shift+i` |

#### Search
| Search actions | Command |
| :---           | :---    |
| Go to next word under cursor | `*` |
| Go to previous word under cursor | `#` |
| Show all lines with word under cursor | `[I`, `]I` |
| To search for pattern | `/pattern` |
| Go to next search results | `n` |
| Go to previous search results | `N` |
| To list lines with results last pattern | `:g//` |
| List lines with search results for pattern | `:g/pattern/` |
| Search in all Markdown files in current directory | `:vimgrep /pattern/ *.md` |

#### Replace
| Replace actions | Command |
| :---            | :---    |
| Replace `aaa` to `bbb` in whole file | `:%s/aaa/bbb/g` |
| Replace only in lines than contains `string` | `:g/string/s/aaa/bbb/g` |

#### Moving over windows
| Move actions | Command |
| :---         | :---    |
| `:new` horizontal split (editing a new empty buffer) | `<C-w>n` |
| `:split` window horizontally (editing current buffer) | `<C-w>s` |
| `:vsplit` window vertically (editing current buffer) | `<C-w>v` |
| `:close` window | `<C-w>c` |
| close all windows, leaving :only the current window open | `<C-w>o` |
| go to next window | `<C-w>w` |
| go to previous window | `<C-w>p` |
| go to window above | `<C-w><Up>` |
| go to window below | `<C-w><Down>` |
| go to window on left | `<C-w><Left>` |
| go to window on right | `<C-w><Right>` |

### Add-ons

#### Editing file with (m)vim
* `vim -p file1 file2` open in tabs
* `mvim --remote-tab file3` open file in existing editor as tab

#### Add new file type detection
```sh
$ mkdir ~/.vim/ftdetect
$ echo "au BufRead,BufNewFile *.ex,*.exs set filetype=elixir" > ~/.vim/ftdetect/elixir.vim
```

#### Reload `~/.vimrc` file without restarting vim
```sh
:so ~/.vimrc
```

#### Install new color theme
```sh
$ mkdir ~/.vim/colors/
$ mv mustang.vim ~/.vim/colors/
```

#### Show recently used files
* `:oldfiles` or `:browse oldfiles`
