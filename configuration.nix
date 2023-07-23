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
  nix.package = pkgs.nixVersions.stable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
    extra-platforms = aarch64-darwin x86_64-darwin
  '';

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # https://github.com/LnL7/nix-darwin/blob/master/modules/system/activation-scripts.nix:
  # A set of shell script fragments that are executed when a NixOS system configuration is activated.
  system.activationScripts.postActivation.text = ''
    # same as "Prevent your Mac from automatically sleeping when the display is off"
    # means that require password after sleep is not triggered
    sudo pmset -c sleep 0  
    # disable reboot sound effect
    sudo nvram SystemAudioVolume=" "
  '';
  system.defaults = {

    # TODO:
    # external keyboard settings
    CustomUserPreferences = {
      # set menu bar clock format, lol this is the most complete docs I could find for the format https://www.manageengine.com/au/products/desktop-central/script-templates/scripts/SetDateFormat.txt
      # "com.apple.menuextra.clock".DateFormat = "EEE d MMM h:mm a";
      # show battery percentage
      "com.apple.menuextra.battery".ShowPercent = true;
      # enabled menu bar icons
      "com.apple.controlcenter"."NSStatusItem Visible Sound" = 1;
      "com.apple.controlcenter"."NSStatusItem Visible Battery" = 1;
      "com.apple.controlcenter"."NSStatusItem Visible Bluetooth" = 1;
      "com.apple.controlcenter"."NSStatusItem Visible FocusModes" = 1;
      "com.apple.controlcenter"."NSStatusItem Visible UserSwitcher" = 1;
      # disabled menu bar icons
      "com.apple.controlcenter"."NSStatusItem Visible NowPlaying" = 0;
      "com.apple.controlcenter"."NSStatusItem Visible BentoBox" = 0;
      "com.apple.Spotlight"."NSStatusItem Visible Item-0" = 0;
      # grey accent color
      NSGlobalDomain.AppleAccentColor = -1;
      NSGlobalDomain.AppleAquaColorVariant = 6;
      # graphite highlight color
      NSGlobalDomain.AppleHighlightColor = "0.847059 0.847059 0.862745 Graphite";
    };

    # menu bar clock
    menuExtraClock.IsAnalog = false;
    menuExtraClock.Show24Hour = false;
    menuExtraClock.ShowAMPM = true;
    menuExtraClock.ShowDayOfMonth = true;
    menuExtraClock.ShowDayOfWeek = true;
    menuExtraClock.ShowSeconds = false;

    ".GlobalPreferences"."com.apple.mouse.scaling" = "-1.0";    # disable mouse acceleration
    universalaccess.reduceTransparency = false;                  # reduce transparency (purple glitch)
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
      "com.apple.sound.beep.feedback" = 0;                # enable audio feedback when adjusting volume
    };

    trackpad = {
      Clicking = true;                 # enable tap to click
    };

    # TODO: implement defaults write com.apple.dock workspaces-auto-swoosh -bool NO
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
      SHOWFULLNAME = false;    # display name and password field instead of userlist
    };

  };

  # services
  services = {

    skhd = {
      enable = true;
      package = pkgs.skhd;
      skhdConfig = ''
        # Terminal
        alt - return : /System/Applications/Utilities/Terminal.app/Contents/MacOS/Terminal
	# Firefox
	alt - f : open  -n -a /Applications/Firefox.app --args -P home
      '';
    };

  };

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
      "firefox"
      "discord"
      "docker"
      "zoom"
      "qutebrowser"
    ];
    brews = [
      "emacs"
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
