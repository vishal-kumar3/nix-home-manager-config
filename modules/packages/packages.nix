{ pkgs, ... }:

with pkgs; {
  home.packages = [
    # Core utilities (removed neovim)
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

    # LSP and formatters (moved to nvim/default.nix)

    # Fonts
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.geist-mono
  ];
}
