{
  description = "Nix Darwin System Configurations";

  inputs = {

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-22.05-darwin";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs @ { self, darwin, nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";
      # system = "x86_64-darwin";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      lib = nixpkgs.lib;
    in {
    homeManagerConfigurations = {
      softsun2 = home-manager.lib.homeManagerConfiguration {
        inherit system;
        inherit pkgs;
        configuration = ./home.nix;
        username = "softsun2";
        homeDirectory = "/home/softsun2";
      };
    };

    darwinConfigurations = {
      weevil = darwin.lib.darwinSystem {
        inherit system;
        modules = [ ./configuration.nix ];
      };
    };      

    };
}
