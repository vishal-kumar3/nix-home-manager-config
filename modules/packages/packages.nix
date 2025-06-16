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

    firefox
    vscode
    brave
    kitty
    telegram-desktop
    obsidian

    tmux
    ripgrep
    zoxide

    # Fonts
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.geist-mono
  ];
}
