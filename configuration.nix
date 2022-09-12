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
    extra-platforms = aarch64-darwin x86_64-darwin
  '';

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # system fonts
  fonts = {
    fontDir.enable = true;     # install fonts to /Library/Fonts
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };

  system.defaults = {
    NSGlobalDomain = {
      # keybord
      ApplePressAndHoldEnabled = false;               # enable key repeating
      # value references for the following options
      # https://apple.stackexchange.com/questions/261163/default-value-for-nsglobaldomain-initialkeyrepeat
      InitialKeyRepeat = 15;                          # delay before repeats begin
      KeyRepeat = 3;                                  # delay between repeats
      # TODO: Do I really need these?
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;

      # trackpad
      "com.apple.swipescrolldirection" = false;     # mouse-wheel-like scrolling
      AppleEnableSwipeNavigateWithScrolls = false;  # disable two finger navigation gesture

      # misc
      AppleInterfaceStyle = "Dark";                       # dark mode
      AppleInterfaceStyleSwitchesAutomatically = false;   # disable auto dark/light mode
      "com.apple.sound.beep.feedback" = 1;                # enable audio feedback when adjusting volume
    };

    trackpad = {
      Clicking = true;                 # enable tap to click
    };

    dock = {
      autohide = true;
      mru-spaces = false;              # disable rearranging spaces based on most recent use
      show-recents = false;            # hide recent applications
      launchanim = false;              # disable opening application animations
      tilesize = 50;                   # default is 64
    };

    finder = {
      AppleShowAllExtensions = true;   # show all file extensions
      AppleShowAllFiles = true;        # show hidden files
      QuitMenuItem = true;             # enable quitting finder
      _FXShowPosixPathInTitle = true;  # show the full POSIX filepath in the window title
      FXPreferredViewStyle = "clmv";   # set the default view to column view
    };

    loginwindow = {
      GuestEnabled = false;   # no guests on my watch
      SHOWFULLNAME = true;    # display name and password field instead of userlist
    };

  };

  # services
  services = {

    yabai = {
      enable = true;
      package = pkgs.yabai;
      config = {
        focus_follow_mouse = "autofocus";
        layout = "bsp";
      };
    };

    skhd = {
      enable = true;
      package = pkgs.skhd;
    };

  };

  # homebrew
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
    };
    global = {
      brewfile = true;
      lockfiles = false;
    };
    taps = [
      "homebrew/cask"
      "homebrew/cask-versions"
    ];
    casks = [
      "unity-hub"
      "bartender"
      "discord"
      "firefox"
      "launchbar"
      "slack"
      "spotify"
      "zoom"
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
