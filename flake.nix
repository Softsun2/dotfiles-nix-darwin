{
  description = "Nix Darwin System Configurations";

  inputs = {

    nixpkgs.url = github:nixos/nixpkgs/nixos-23.05;
    darwin = {
      url = github:lnl7/nix-darwin;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = github:nix-community/home-manager/release-23.05;
      inputs.nixpkgs.follows = "nixpkgs";
    };
    buffalo.url = github:Softsun2/dotfiles-NixOS;

  };

  outputs = inputs @ { self, nixpkgs, darwin, home-manager, buffalo, ... }:
  let

    system = "aarch64-darwin";
    pkgs = import nixpkgs {
      inherit system;
      # overlays = [ ];
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
        modules = [ ./configuration.nix ];
      };
    };

    packages."x86_64-linux" = {
      srcds =
      let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
      in import containers/srcds.nix {
        inherit pkgs;
      };
    };

  };
}
