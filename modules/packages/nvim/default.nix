# modules/nvim/default.nix
{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraLuaConfig = ''
      ${builtins.readFile ./lua/settings.lua}
      ${builtins.readFile ./lua/keymaps.lua}
      ${builtins.readFile ./lua/plugins.lua}
      ${builtins.readFile ./lua/lsp.lua}
    '';
  };

  home.packages = with pkgs; [
    # LSP servers
    nodePackages.typescript-language-server # TypeScript/JavaScript
    gopls # Golang
    marksman # Markdown
pyright # Python


    # Formatters and linters
    nodePackages.prettier # JavaScript/TypeScript
    golangci-lint # Golang
    nodePackages.eslint # JavaScript/TypeScript

    # Dependencies for plugins
    nodejs # Required for Copilot and some LSPs
    ripgrep # For Telescope
    fd # For Telescope
  ];
}
