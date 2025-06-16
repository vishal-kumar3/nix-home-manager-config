{ pkgs, ... }:

with pkgs; {
  home.packages = [
    neovim
    htop
    curl
    fzf
    bat
    wget
    unzip
    tree
eza # Better ls
fd # Better find


    firefox
    vscode
    brave
    kitty
    telegram-desktop
    obsidian

    tmux
    ripgrep
    zoxide

    # LSP and formatters
    nil # Nix LSP
    nixfmt-classic # Nix formatter

    # Fonts
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.geist-mono
  ];
}
