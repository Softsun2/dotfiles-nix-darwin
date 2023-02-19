{ config, pkgs, ... }:
# TODO: package my image-go-nord filtering package for portibility
let
  my-python-packages = p: with p; [
    image-go-nord
  ];
in
{
  # nix-darwin options: https://daiderd.com/nix-darwin/manual/index.html
  # https://github.com/LnL7/nix-darwin/blob/master/tests/system-defaults-write.nix
  # system packages
  environment.systemPackages = with pkgs; [
    vim
    git
    (python3.withPackages my-python-packages)
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

  # system fonts
  # available nerdfonts: https://github.com/NixOS/nixpkgs/blob/nixos-22.11/pkgs/data/fonts/nerdfonts/shas.nix
  fonts = {
    fontDir.enable = true;     # install fonts to /Library/Fonts
    fonts = with pkgs; [
      scientifica
      efont-unicode
      cozette
      nerdfonts
      liberation_ttf
      # (nerdfonts.override { fonts = [ 
      #   "JetBrainsMono"
      #   "FiraCode"
      #   "Gohu"
      #   "Terminus"
      #   "SourceCodePro"
      #   "Iosevka"
      # ]; })
    ];
  };


  system.defaults = {

    # mouse
    ".GlobalPreferences"."com.apple.mouse.scaling" = "-1.0";    # disable mouse acceleration
    universalaccess.reduceTransparency = true;                  # reduce transparency (purple glitch)

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
      SHOWFULLNAME = true;    # display name and password field instead of userlist
    };

  };

  # services
  services = {

    yabai = {
      enable = true;
      config = {
        # https://github.com/koekeishiya/yabai/blob/master/doc/yabai.asciidoc#config

        # global settings
        mouse_follows_focus = "off";          # don't move mouse to focused window
        focus_follows_mouse = "autoraise";    # focus but don't raise window under mouse
        window_origin_display = "default";    # new windows are managed by active display
        window_placement = "second_child";    # new windows become second-leaf node
        window_topmost = "off";               # don't make floating windows stay on top
        window_shadow  = "off";
        window_opacity = "off";               # disable opacity for windows
        window_opacity_duration = 0.0;        # duration of opacity transition
        active_window_opacity = 1.0;
        normal_window_opacity = 0.90;

        window_border = "on";                # draw window borders, this doesn't seem to be working anyway
        window_border_blur = "on";
        window_border_width = 1;
        active_window_border_color = "0xff81A1C1";
        normal_window_border_color = "0xff4C566A";

        split_ratio = 0.50;
        auto_balance = "off";                 # disable all windows occupying the same amount of area
        mouse_modifier = "fn";                # mod key for mouse actions
        mouse_action1 = "move";               # mod + left-click -> move window
        mouse_action2 = "resize";             # mod + right-click -> resize mindow
        mouse_drop_action = "swap";           # dropping a window onto the center of another window swaps the two windows

        # space settings
        layout = "bsp";                       # binary space partitions
        top_padding = 15;
        bottom_padding = 15;
        left_padding = 15;
        right_padding = 15;
        window_gap = 15;

      };

      extraConfig = ''
        yabai -m rule --add app="^System Preferences$" manage=off
        yabai -m rule --add app="^Archive Utility$" manage=off
        yabai -m rule --add app="^zoom.us$" manage=off
      '';

    };

    skhd = {
      enable = true;
      package = pkgs.skhd;
      skhdConfig = ''
        # These are bound to change, I want these to emulate dwm at some point

        # focus window
        alt - h : yabai -m window --focus west
        alt - j : yabai -m window --focus south
        alt - k : yabai -m window --focus north
        alt - l : yabai -m window --focus east

        # swap managed window
        shift + alt - h : yabai -m window --swap west
        shift + alt - j : yabai -m window --swap south
        shift + alt - k : yabai -m window --swap north
        shift + alt - l : yabai -m window --swap east

        # move managed window
        shift + alt + ctrl - h : yabai -m window --warp west
        shift + alt + ctrl - j : yabai -m window --warp south
        shift + alt + ctrl - k : yabai -m window --warp north
        shift + alt + ctrl - l : yabai -m window --warp east

        # rotate tree
        alt - r : yabai -m space --rotate 90

        # toggle window fullscreen zoom
        alt - f : yabai -m window --toggle zoom-fullscreen

        # toggle padding and gap
        alt - g : yabai -m space --toggle padding; yabai -m space --toggle gap

        # float / unfloat window and center on screen
        alt - t : yabai -m window --toggle float;\
                  yabai -m window --grid 4:4:1:1:2:2

        # toggle window split type
        alt - e : yabai -m window --toggle split

        # balance size of windows
        shift + alt - 0 : yabai -m space --balance

        # move window and focus desktop
        shift + alt - 1 : yabai -m window --space 1; yabai -m space --focus 1
        shift + alt - 2 : yabai -m window --space 2; yabai -m space --focus 2
        shift + alt - 3 : yabai -m window --space 3; yabai -m space --focus 3
        shift + alt - 4 : yabai -m window --space 4; yabai -m space --focus 4
        shift + alt - 5 : yabai -m window --space 5; yabai -m space --focus 5
        shift + alt - 6 : yabai -m window --space 6; yabai -m space --focus 6
        shift + alt - 7 : yabai -m window --space 7; yabai -m space --focus 7
        shift + alt - 8 : yabai -m window --space 8; yabai -m space --focus 8
        shift + alt - 9 : yabai -m window --space 9; yabai -m space --focus 9

        # create desktop, move window and follow focus - uses jq for parsing json (brew install jq)
        shift + alt - n : yabai -m space --create && \
                           index="$(yabai -m query --spaces --display | jq 'map(select(."native-fullscreen" == 0))[-1].index')" && \
                           yabai -m window --space "$\{index}" && \
                           yabai -m space --focus "$\{index}"

        # fast focus desktop
        cmd - 0 : yabai -m space --focus recent

        # send window to monitor and follow focus
        shift + alt - n : yabai -m window --display next; yabai -m display --focus next
        shift + alt - p : yabai -m window --display previous; yabai -m display --focus previous

        # increase window size
        shift + alt - w : yabai -m window --resize top:0:-20
        shift + alt - d : yabai -m window --resize left:-20:0

        # decrease window size
        shift + alt - s : yabai -m window --resize bottom:0:-20
        shift + alt - a : yabai -m window --resize top:0:20

        # Terminal
        alt - return : /Users/softsun2/.nix-profile/bin/kitty -d=$HOME --single-instance --start-as=maximized

        # dmenu type launcher:
        # alt - p :
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
      "hex-fiend"
      "firefox"
      "discord"
      "vcv-rack"
      "supercollider"
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
