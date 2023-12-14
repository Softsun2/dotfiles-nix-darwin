{ config, pkgs, lib, ... }:
{
  manual.manpages.enable = false;
  programs.home-manager.enable = true;

  # pin home manager modules/packages to the latest nix-stable channel
  home.stateVersion = "23.05";
  
  home.username = "softsun2";
  home.homeDirectory = /Users/softsun2;
  home.packages = with pkgs; [
    # dev
    ffmpeg
    yt-dlp
    tldr
    tree
    plistwatch
    neofetch
    jq

    # emacs extra packages
    # rnix-lsp
    # pyright
    # nixfmt

    # misc
    optifinePackages.optifine_1_19_2
  ];

  # TODO: reduce code resuse with some sort of higher order function
  home.file."${config.home.username}/agenda/.keep".text = "";
  home.file."${config.home.username}/archive/.keep".text = "";
  home.file."${config.home.username}/dev/.keep".text = "";
  home.file."${config.home.username}/documents/.keep".text = "";
  home.file."${config.home.username}/literature/.keep".text = "";
  home.file."${config.home.username}/music/.keep".text = "";
  home.file."${config.home.username}/pictures/.keep".text = "";
  home.file."${config.home.username}/school/.keep".text = "";
  home.file."${config.home.username}/videos/.keep".text = "";
  home.file."${config.home.username}/writing/.keep".text = "";

  programs.zsh = {
    enable = true;
    initExtra = ''
      ${config.home.homeDirectory}/.dotfiles/bin/solar-system
    '';
    shellAliases = {
      l = "ls -l";
      ll = "ls -al";

      # window role patch support
      # https://nixos.wiki/wiki/Emacs#Window_manager_integration
      emacs = "${config.programs.emacs.finalPackage}/Applications/Emacs.app/Contents/MacOS/Emacs";
    };
    cdpath = [ "${config.home.homeDirectory}/softsun2" ];
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    extraLuaConfig = ''
      -- source my config
      vim.opt.runtimepath:prepend('${config.home.homeDirectory}/.dotfiles/config/nvim')
      require('ss2-init')
    '';
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig          # community maintained lsp configurations
      lspkind-nvim            # lsp suggestion pictograms

      nvim-cmp                # completion engine
      cmp-nvim-lsp            # lsp completion source
      cmp-path                # file system completion source

      # am I lazy enough to use snippets?
      # luasnip
      # friendly-snippets

      # treesitter with grammars
      (nvim-treesitter.withPlugins (g: with g; [
        nix
        lua
        bash
        c cpp
        haskell
      ]))

      vim-nix                 # nix
      gitsigns-nvim           # gutter git info
      telescope-nvim          # integrated fuzzy finder
    ];
    extraPackages = with pkgs; [
      rnix-lsp
      sumneko-lua-language-server
      ripgrep
    ];
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk.overrideAttrs (o: {
      patches = o.patches ++ [
        ./config/emacs/patches/fix-window-role.patch
        ./config/emacs/patches/round-undecorated-frame.patch
        ./config/emacs/patches/system-appearance.patch
      ];
    });
    extraConfig = ''
      (setq user-init-file
        "${config.home.homeDirectory}/.dotfiles/config/emacs/ss2-init.el")
      (load user-init-file)
    '';
    # declare emacs packages with nix
    extraPackages = pkgs: with pkgs; [ 
      use-package
      meow
      ef-themes
      eglot
      company
      org-roam
      expand-region

      # language modes
      nix-mode
      haskell-mode
      tuareg # ocaml mode
    ];
  };

  programs.tmux = {
    enable = true;
    prefix = "C-a";
    escapeTime = 50;
    terminal = "screen-256color";
    extraConfig = ''
      set-option -g status-position bottom
    '';
  };

  programs.git = {
    enable = true;
    userName = "softsun2";
    userEmail = "peyton.okubo13@gmail.com";
    extraConfig = {
      init = { defaultBranch = "main"; };
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [ "--color=16" ];
  };

}
