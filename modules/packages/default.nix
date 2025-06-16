{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./zsh.nix
    ./development.nix
    ./packages.nix
    ./neovim.nix
  ];
}
