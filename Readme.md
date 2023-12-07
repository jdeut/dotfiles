# General

`stow` symlinks everything to the right location

# Dependencies

```
    sudo apt-get install stow fzf ranger neovim xclip\
        wget meson valac libvala-0.56-dev gobject-introspection\
        libgirepository1.0-dev libjsonrpc-glib-1.0-dev\
        zsh zsh-antigen sqlite3 ripgrep
```

# Base System

```
    stow -S ranger neovim zsh ripgrep
```

# Submodules

## Add Submodule

```
~/.dotfiles/mpv/.config/mpv/scripts % git submodule add --name mpv-youtube-ui "https://github.com/eatsu/mpv-osc-youtube-ui" youtube-ui/remote
```

The given URL is recorded into .gitmodules.


## Delete Submodule

 A submodule can be deleted by running

```
 git rm <submodule path> && git commit.
```

## Update Submodules

```
    git submodule update --remote --recursive --merge
```

If `git status` shows `Submodules changed but not updated`:

```
git submodule update --init --recursive
```
???

# mpv

## Scripts

Scripts  can  be  passed  to the --script option, and are automatically
loaded from the scripts subdirectory of the mpv configuration directory
(usually ~/.config/mpv/scripts/).

If a script is  a  directory, then  the  directory  represents a single script.
The player will try to load a file named main.x, where  x  is replaced with the
file extension. For example, if main.lua exists, it is loaded with the Lua scripting backend.
