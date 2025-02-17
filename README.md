# Dotfiles

Keep dot files updated on different machines.
This repository contains main configuration for `zsh` and `vim` for great productivity.

## Installation

Run to update: `rake`

Main idea from this post:
[Synchronizing Dotfiles](http://benscheirman.com/2013/12/synchronizing-dotfiles/)

### Local configuration examples

Setup brew, disable sessions, can set cargo path for zsh in `.config/zsh/.zlocal`

```
export SHELL_SESSIONS_DISABLE=1
eval "$(/opt/homebrew/bin/brew shellenv)"
source "$HOME/.cargo/env"
```

The same but for fish in `.config/fish/conf.d/local.fish`

```
eval "$(/opt/homebrew/bin/brew shellenv)"
fish_add_path $HOME/.cargo/bin/
```

Setup fish shell for Kitty in `.config/kitty/local.conf`

```
shell /opt/homebrew/bin/fish
env SHELL=/opt/homebrew/bin/fish
```

### Kitty icon

```
kitty +runpy 'from kitty.fast_data_types import cocoa_set_app_icon; import sys; cocoa_set_app_icon(*sys.argv[1:]); print("Noice!")' .config/kitty/dark.icns /Applications/kitty.app
```

## Font

[Iosevka](https://github.com/be5invis/Iosevka)
