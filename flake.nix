{
  description = "Nix Darwin System Configurations";

  inputs = {

    nixpkgs.url = github:nixos/nixpkgs/nixos-23.05;
    darwin = {
      url = github:lnl7/nix-darwin;
      # url = github:softsun2/nix-darwin;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs @ { self, nixpkgs, darwin, home-manager, ... }:
  let

    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};

  in {

    homeConfigurations.softsun2 = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ ./home.nix ];
    };

    darwinConfigurations = {
      woollymammoth = darwin.lib.darwinSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };
    };

  };
}
