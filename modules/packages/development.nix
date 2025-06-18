{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Core development tools
    git
    python3
nodejs_22

    gcc
    gnumake
cmake


# Language runtimes
go rustup openjdk21 dotnet-sdk_8


# Go backend specific tools
migrate # Database migrations
protoc-gen-go # Protocol buffer Go plugin
protoc-gen-go-grpc # gRPC Go plugin
k6 # Load testing
vegeta # HTTP load testing
bombardier # HTTP benchmarking

    # Development utilities
    docker
    docker-compose
lazydocker # TUI for Docker


    # API tools
    postman
insomnia # API testing

grpcurl # gRPC testing


    # Database tools
sqlite postgresql mongodb-tools redis


    # Productivity tools
    direnv # Per-project environment variables
just # Command runner
tokei # Code statistics
hyperfine # Benchmarking tool
dust # Better du
procs # Better ps
bottom # Better htop
bandwhich # Network utilization


# Git tools (lazygit and gh moved to nvim/default.nix)
git-cliff # Changelog generator
onefetch # Git repo summary


# Task management
taskwarrior3


# JSON/YAML tools (jq, yq, httpie moved to nvim/default.nix)
fx # JSON viewer


# Network tools
curlie # curl with httpie syntax


# File management
zoxide # Better cd
broot # Tree view with navigation


# Text processing
sd # Better sed
choose # Cut alternative


# Monitoring
zenith # System monitor

  ];

  # Enable direnv integration
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  # Zoxide for smart directory jumping
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
