{ pkgs ? import <nixpkgs> {} }:
pkgs.vimUtils.buildVimPlugin {
  name = "rasmus.nvim";
  version = "2022-10-22";
  src = pkgs.fetchFromGitHub {
    owner = "kvrohit";
    repo = "rasmus.nvim";
    rev = "187b40998fd0d03e915699bfc37a616f3e6ccb23";
    sha256 = "sha256-3Fyfc0B4xJrCMxkUMrt4yxiwwFpe8gnIC8nt9FUUGlc";
  };
  meta.homepage = "https://github.com/kvrohit/rasmus.nvim";
}
