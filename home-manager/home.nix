{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "vvusirik";
  home.homeDirectory = "/home/vvusirik";

  # The home.packages option allows you to install Nix packages into your environment.
  home.packages = with pkgs; [
    gcc
    neovim
    llvmPackages_rocm.clang-tools-extra
    zsh
    fzf
    tmux
    ripgrep
    htop
  ];

  # Manage dotfiles from ~/dotfiles
  home.file = {
    ".config/nvim".source = /home/vvusirik/dotfiles/nvim;
    ".config/alacritty".source = /home/vvusirik/dotfiles/alacritty;
    ".bash_aliases".source = /home/vvusirik/dotfiles/bash/.bash_aliases;
    ".bashrc".source = /home/vvusirik/dotfiles/bash/.bashrc;
    ".gitconfig".source = /home/vvusirik/dotfiles/git/.gitconfig;
    ".tmux.conf".source = /home/vvusirik/dotfiles/tmux/.tmux.conf;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.
}
