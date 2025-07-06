{
  hostname,
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Load .env file and update PATH
    initContent = ''
      # Add Bun to PATH
      export PATH="$HOME/.bun/bin:$PATH"
      export PATH="$HOME/.local/bin:$PATH"
      source ~/.nvim-dev-env
      # Load .env file from nix directory
      if [ -f "$HOME/nix/.env" ]; then
        export $(cat "$HOME/nix/.env" | grep -v '^#' | xargs)
      fi
    '';

    # Use Oh My Zsh
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell"; # Classic OMZ theme
      plugins = [
        "git"
        "sudo"
        "docker"
        "kubectl"
        "node"
        "npm"
        "yarn"
        "python"
        "pip"
        "golang"
        "rust"
        "direnv"
      ];
    };

    # Much simpler completion setup
    completionInit = ''
      autoload - Uz compinit compinit

      # Basic completion styling
      zstyle ':completion:*' menu select
      zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

      # fzf-tab basic setup
      zstyle ':fzf-tab:complete:*:*' fzf-preview 'eza --icons -a --group-directories-first -1 --color=always $realpath 2>/dev/null || ls -la $realpath'
    '';

    # Oh My Zsh style history settings
    history = {
      size = 10000;
      save = 10000;
      share = true;
      ignoreDups = true;
      ignoreSpace = true;
    };
  };
}
