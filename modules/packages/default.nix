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
    ./shell-integration.nix # nix-shell integration

    ./lazygit.nix
    ./obsidian.nix
    ./nvim/default.nix
  ];
}
