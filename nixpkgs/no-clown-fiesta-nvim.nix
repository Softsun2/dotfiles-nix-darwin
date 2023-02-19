{ pkgs ? import <nixpkgs> {} }:
pkgs.vimUtils.buildVimPlugin {
  name = "no-clown-fiesta.nvim";
  version = "2023-02-17";
  src = pkgs.fetchFromGitHub {
    owner = "aktersnurra";
    repo = "no-clown-fiesta.nvim";
    rev = "c2f222643b83eb27331bc99f3cb4b3e6dbffb6e5";
    sha256 = "sha256-S14qNYLU5aC+19O68VzEevuOnRy0EaSBTf5TPCEnYXI";
  };
  meta.homepage = "https://github.com/aktersnurra/no-clown-fiesta.nvim";
}
