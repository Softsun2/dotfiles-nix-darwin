{ pkgs ? import <nixpkgs> {} }:
pkgs.vimUtils.buildVimPlugin {
  name = "menguless.nvim";
  version = "2020-08-31";
  src = pkgs.fetchFromGitHub {
    owner = "zekzekus";
    repo = "menguless";
    rev = "09072d8edb8f94cc1be63ae2c7ff4ae091189f16";
    sha256 = "sha256-2QfSdtq7Jt3Bhx/6iTfltEFrLyl63DZ+RmY0hM8f4Os";
  };
  meta.homepage = "https://github.com/zekzekus/menguless";
}
