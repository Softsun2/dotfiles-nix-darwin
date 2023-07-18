{
  description = "Nix Darwin System Configurations";

  inputs = {

    nixpkgs.url = github:nixos/nixpkgs/nixpkgs-unstable;
    nur.url = github:nix-community/NUR;
    darwin = {
      url = github:lnl7/nix-darwin;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs @ { self, darwin, nixpkgs, nur, home-manager, ... }:
  # need to include x86 packages that can't be built on arm yet
  let
    system = "aarch64-darwin";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [ nur.overlay ];
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
