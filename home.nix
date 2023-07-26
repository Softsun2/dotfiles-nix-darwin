{ config, pkgs, ... }:
{
  manual.manpages.enable = false;
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    shellcheck
    ffmpeg
    yt-dlp
    tldr
    tree
    plistwatch
    neofetch
  ];

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
