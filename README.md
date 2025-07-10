# Dotfiles

Dotfiles (and scripts) that I use in my daily workflow managed by GNU Stow.
Stow creates symlinks between a target directory (normally a home dir) and the files in this repo.

For example:

```
stow --target=/home/vvusirik/ tmux
```

Would create symlinks in my home directory to all the files in the `tmux` directory in this repo:

```
.tmux.conf -> dotfiles/tmux/.tmux.conf
```
