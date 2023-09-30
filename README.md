# Dotfiles
Dotfiles (and scripts) that I use in my daily workflow managed by [HomeManager](https://nix-community.github.io/home-manager/index.html) in NixOS.

## Home Manager Install
1. Install home-manager in NixOS by editing `/etc/nixos/configuration.nix`:
```
  environment.systemPackages = with pkgs; [
    ...
    home-manager
  ];
```
2. Rebuild NixOS. 
```
$ sudo nixos-rebuild switch
```
3. Initialize the `home.nix` config.
For a fresh install:
```
$ home-manager init
```
Or just link the config in this repo:
```
$ ln -s <path to dotfiles/>/home-manager/home.nix /home/vvusirik/.config/home-manager/home.nix
```

## Home Manager Usage
1. Edit the `home.nix` to include links to files in `dotfiles`.
```nix
  home.file = {
    # Building this configuration will create a copy of 'dotfiles/screenrc' in
    ".config/nvim".source = /home/vvusirik/dotfiles/nvim;
    ".config/alacritty".source = /home/vvusirik/dotfiles/alacritty;
    ".bash_aliases".source = /home/vvusirik/dotfiles/bash/.bash_aliases;
    ".bashrc".source = /home/vvusirik/dotfiles/bash/.bashrc;
    ".gitconfig".source = /home/vvusirik/dotfiles/git/.gitconfig;
    ".tmux.conf".source = /home/vvusirik/dotfiles/tmux/.tmux.conf;
    
    # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
```
2. Rebuild the home manager:
```
$ home-manager switch
```
