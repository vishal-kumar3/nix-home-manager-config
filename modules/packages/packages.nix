{ pkgs, ... }:

with pkgs; {
  home.packages = [
    # Core utilities
    htop
    curl
    fzf
    bat
    wget
    unzip
    tree
    eza # Better ls
    fd # Better find

    # Applications
    firefox
    vscode
    brave
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
