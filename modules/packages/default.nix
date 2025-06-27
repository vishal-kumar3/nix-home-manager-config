{ config, pkgs, ... }:

{
  imports = [
    ./bat.nix                         # better cat command
    ./git.nix
    ./zsh
    ./development.nix
    ./packages.nix
    ./fzf.nix                         # fuzzy finder
    ./ghostty.nix                     # terminal
./kitty # kitty terminal (modular)

    ./lazygit.nix
    ./obsidian.nix
    ./nvim/default.nix
  ];
}
