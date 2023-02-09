{
  description = "Nix Darwin System Configurations";

  inputs = {

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs @ { self, darwin, nixpkgs, home-manager, ... }:
  # need to include x86 packages that can't be built on arm yet
  let
    system = "aarch64-darwin";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    lib = nixpkgs.lib;
  in {
    homeManagerConfigurations = {
      softsun2 = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          {
            home = {
              username = "softsun2";
              homeDirectory = "/Users/softsun2";
              stateVersion = "22.11";
            };
          }
        ];
      };
    };

    darwinConfigurations = {
      woollymammoth = darwin.lib.darwinSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };
    };

  };
}
