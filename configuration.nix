{ config, pkgs, ... }:

{
  # nix-darwin options: https://daiderd.com/nix-darwin/manual/index.html
  # https://github.com/LnL7/nix-darwin/blob/master/tests/system-defaults-write.nix
  # system packages
  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  # enable flakes
  nix.package = pkgs.nixFlakes;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # system fonts
  fonts = {
    fontDir.enable = true;     # install fonts to /Library/Fonts
    fonts = with pkgs; [
      jetbrains-mono
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      unifont 
    ];
  };

  # enable key repeating at default speed
  system.defaults.NSGlobalDomain.ApplePressAndHoldEnabled = false;
  # value references for the following options
  # https://apple.stackexchange.com/questions/261163/default-value-for-nsglobaldomain-initialkeyrepeat
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 25;
  system.defaults.NSGlobalDomain.KeyRepeat = 6;

  # trackpad
  system.defaults.trackpad.Clicking = true;                                   # enable tap to click
  system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false;    # disable natural scrolling

  # dock
  system.defaults.dock.autohide = true;
  system.defaults.dock.mru-spaces = false;      # disable rearranging spaces based on most recent use
  system.defaults.dock.show-recents = false;    # hide recent applications

  # finder
  system.defaults.finder.AppleShowAllFiles = true;        # show hidden files
  system.defaults.finder.ShowStatusBar = true;            # show status bar at bottom of finder windows with item/disk space stats
  system.defaults.finder.FXPreferredViewStyle = "clmv";   # set the default view to column view

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
