{ config, pkgs, ... }:

{
  # Import modular package configurations
  imports = [
    ./modules/packages/default.nix
  ];

  # Enable Home Manager
  programs.home-manager.enable = true;

  # font config
  fonts.fontconfig.enable = true;

  # Basic user configuration
  home = {
    packages = with pkgs; [
      # Add any additional packages here directly if needed

    ];
  };
}
