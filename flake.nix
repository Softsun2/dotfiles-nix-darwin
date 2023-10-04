{
  description = "Nix Darwin Configurations";

  inputs = {

    nixpkgs.url = github:nixos/nixpkgs/nixpkgs-23.05-darwin;
    nixpkgs-unstable.url = github:nixos/nixpkgs/nixpkgs-unstable;
    
    darwin = {
      url = github:lnl7/nix-darwin;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = github:nix-community/home-manager/release-23.05;
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, darwin, home-manager, ... }:
    let
      
      system = "aarch64-darwin";
      
      # yabai usually breaks every MacOS update; pull in yabai updates asap
      yabai-unstable-overlay = (final: prev: {
        yabai = nixpkgs-unstable.legacyPackages.${system}.yabai;
      });
      
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ yabai-unstable-overlay ];
        config.allowUnfree = true;
      };

    in {

      homeConfigurations.softsun2 = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        lib = pkgs.lib;
        modules = [ ./home.nix ];
      };

      darwinConfigurations = {
        woollymammoth = darwin.lib.darwinSystem {
          inherit system;
          inherit pkgs;
          modules = [
            ./configuration.nix
          ];
        };
      };

    };
}
