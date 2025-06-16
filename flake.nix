{
  description = "Nix Flake configuration for Manjaro with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ghostty = {
      url = "github:ghostty-org/ghostty";
    };

    nvf.url = "github:notashelf/nvf";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
  let
    username = "vishal";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./home.nix
        {
          home = {
            username = username;
            homeDirectory = "/home/${username}";
            stateVersion = "23.11"; # Adjust based on your Home Manager version
          };
        }
      ];
      extraSpecialArgs = {
        inherit inputs;
      };
    };
  };
}
