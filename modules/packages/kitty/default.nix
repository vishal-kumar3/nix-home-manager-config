{
  inputs,
  pkgs,
  ...
}:
let
  themeScript = import ./themes.nix { inherit pkgs; };
  keybindings = import ./keybindings.nix { inherit themeScript pkgs; };
in
{
  imports = [
    ./kitty.nix
  ];

  programs.kitty = {
    # Import keybindings
    keybindings = keybindings;
  };

  # Add theme switching command to shell
  programs.zsh.shellAliases = {
    kitty-theme = "${themeScript}";
  };
}
