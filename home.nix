{ config, pkgs, lib, ... }:
{
  manual.manpages.enable = false;
  programs.home-manager.enable = true;

  # pin home manager modules/packages to the latest nix-stable channel
  home.stateVersion = "23.05";

  home.username = "softsun2";
  home.homeDirectory = /Users/softsun2;
  home.packages = with pkgs; [
    ffmpeg
    yt-dlp
    tldr
    tree
    plistwatch
    neofetch
  ];

  # TODO: reduce code resuse with some sort of higher order function
  home.file."${config.home.username}/archive/.keep".text = "";
  home.file."${config.home.username}/dev/.keep".text = "";
  home.file."${config.home.username}/documents/.keep".text = "";
  home.file."${config.home.username}/literature/.keep".text = "";
  home.file."${config.home.username}/music/.keep".text = "";
  home.file."${config.home.username}/pictures/.keep".text = "";
  home.file."${config.home.username}/projects/.keep".text = "";
  home.file."${config.home.username}/school/.keep".text = "";
  home.file."${config.home.username}/videos/.keep".text = "";
  home.file."${config.home.username}/writing/.keep".text = "";

  programs.zsh = {
    enable = true;
    shellAliases = {
      l = "ls -l";
      ll = "ls -al";
      ss2 = "cd ~/softsun2";
    };
  };

  # link emacs config
  # home.file.".emacs.d" = {
  #   source = ./config/emacs.d;
  #   recursive = true;
  # };

  programs.vim = {
    enable = true;
    extraConfig = ''
      set nowrap
      set number
      set noswapfile
    '';
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
