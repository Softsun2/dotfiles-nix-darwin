{ pkgs ? import <nixpkgs> {} }:
pkgs.vimUtils.buildVimPlugin {
  name = "menguless.nvim";
  version = "2020-08-31";
  src = pkgs.fetchFromGitHub {
    owner = "zekzekus";
    repo = "menguless";
    rev = "09072d8edb8f94cc1be63ae2c7ff4ae091189f16";
    sha256 = "sha256-0000000000000000000000000000000000000000000";
  };
  meta.homepage = "https://github.com/zekzekus/menguless";
}
