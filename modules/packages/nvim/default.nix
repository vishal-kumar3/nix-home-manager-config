# modules/nvim/default.nix
{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  # Clone NvChad configuration
  home.activation.nvchad = config.lib.dag.entryAfter ["writeBoundary"] ''
    if [ ! -d "$HOME/.config/nvim" ]; then
      $DRY_RUN_CMD ${pkgs.git}/bin/git clone https://github.com/NvChad/starter $HOME/.config/nvim
      $DRY_RUN_CMD rm -rf $HOME/.config/nvim/.git
    fi

    # Copy custom configurations
    $DRY_RUN_CMD mkdir -p $HOME/.config/nvim/lua/custom
    $DRY_RUN_CMD mkdir -p $HOME/.config/nvim/lua/custom/configs

    # Copy main custom files
    $DRY_RUN_CMD cp -f ${./lua/custom/chadrc.lua} $HOME/.config/nvim/lua/custom/chadrc.lua
    $DRY_RUN_CMD cp -f ${./lua/custom/init.lua} $HOME/.config/nvim/lua/custom/init.lua
    $DRY_RUN_CMD cp -f ${./lua/custom/mappings.lua} $HOME/.config/nvim/lua/custom/mappings.lua
    $DRY_RUN_CMD cp -f ${./lua/custom/plugins.lua} $HOME/.config/nvim/lua/custom/plugins.lua

    # Copy configs directory
    $DRY_RUN_CMD cp -f ${./lua/custom/configs/lspconfig.lua} $HOME/.config/nvim/lua/custom/configs/lspconfig.lua
  '';

  home.packages = with pkgs; [
    # Core dependencies
    git curl nodejs_22 python3

    # LSP servers
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted # HTML, CSS, JSON
    lua-language-server
nil # Nix LSP

    gopls pyright marksman # Markdown LSP

    # Formatters and linters
    nodePackages.prettier
    stylua
    nixfmt-classic
    black
    rustfmt
    go # includes gofmt
    gofumpt # Better Go formatter
    goimports-reviser # Imports organizer

    # Go-specific tools
    gotools # includes goimports, godoc, etc.
    golangci-lint # Go linter
    delve # Go debugger
    air # Live reload for Go apps
    goose # Database migrations
    sqlc # Generate Go from SQL
    buf # Protocol buffer tools
    protobuf
    evans # gRPC client

    # Database tools for Go backend
    postgresql # PostgreSQL client
    sqlite # SQLite client
    redis # Redis client
    mongosh # MongoDB shell

    # API and testing tools
    postman # API testing (GUI)
    httpie # Better curl
    jq # JSON processor
    yq # YAML processor

    # Code generation and productivity
    wire # Dependency injection
    mockgen # Mock generation


    # Monitoring and profiling
    pprof # Go profiler

    # Container and deployment
    docker
    docker-compose
    kubectl # Kubernetes CLI

    # Shell formatter and other tools
    shfmt # Shell formatter
    eslint_d
    ruff # Python linter

    # Tools for Telescope and productivity
    ripgrep fd fzf tree-sitter gcc # Required for treesitter compilation
    unzip # Required for Mason
    lazygit gh # GitHub CLI
  ];
}
