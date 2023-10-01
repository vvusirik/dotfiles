git clone git@github.com:vvusirik/dotfiles.git /home/vvusirik/
ln -s /home/vvusirik/dotfiles/home-manager/home.nix /home/vvusirik/.config/home-manager/home.nix
sudo ln -s /home/vvusirik/dotfiles/nixos/configuration.nix /etc/nixos/configuration.nix
sudo ln -s /home/vvusirik/dotfiles/nixos/hardware-configuration.nix /etc/nixos/hardware-configuration.nix

sudo nixos-rebuild switch
home-manager switch
