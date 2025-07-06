{ config, pkgs, lib, ... }:

{
  # Set up shell integration
  programs.zsh = lib.mkIf config.programs.zsh.enable {
    shellAliases = {
      nix-shell = "nix-shell --run $SHELL";
    };

    initContent = ''
      # Function to enter nix-shell with current environment
      nix-shell-here() {
        if [ -f shell.nix ] || [ -f default.nix ]; then
          nix-shell --run "$SHELL" "$@"
        else
          echo "No shell.nix or default.nix found"
        fi
      }

      # Enhanced nix-shell function that preserves environment
      nix-shell-env() {
        if [ $# -eq 0 ]; then
          nix-shell --run "$SHELL"
        else
          nix-shell "$@" --run "$SHELL"
        fi
      }

      # Preserve environment variables in nix-shell
      export NIX_SHELL_PRESERVE_PROMPT=1

      # Better integration with any-nix-shell
      if [[ -n "$IN_NIX_SHELL" ]]; then
        export PS1="(nix) $PS1"
      fi

      # Initialize any-nix-shell if available
      if command -v any-nix-shell >/dev/null 2>&1; then
        any-nix-shell zsh --info-right | source /dev/stdin
      fi
    '';
  };

  # Ensure direnv integration if available
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  # Add useful packages for shell integration
  home.packages = with pkgs; [
    nix-direnv
    any-nix-shell  # Better nix-shell integration
  ];
}
