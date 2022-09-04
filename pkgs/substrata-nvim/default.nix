{ buildVimPluginFrom2Nix, fetchFromGitHub }:
{
  substrata-nvim = buildVimPluginFrom2Nix {
    pname = "substrata.nvim";
    version = "2022-06-21";
    src = fetchFromGitHub {
      owner = "kvrohit";
      repo = "substrata.nvim";
      rev = "aea8143ceab98ffcb02934773cc3b4249425f76c";
      sha256 = "1za8li02j4nhqjjsyxg4p78638h5af4izim37zc0p1x55zr3i85r";
    };
    meta.homepage = "https://github.com/kvrohit/substrata.nvim";
  };
}
