{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Development tools
    git
    python3
    nodejs
    gcc
    gnumake
    docker
    docker-compose
    postman
    go
    gopls # Go language server
    delve # Go debugger
    go-tools # Go static analysis tools
    rustup
    openjdk
    lazygit # TUI for Git
    direnv # Per-project environment variables
    taskwarrior3 # Task management
  ];

  # Enable direnv integration with zsh
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
