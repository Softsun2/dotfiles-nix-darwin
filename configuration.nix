{ config, pkgs, ... }:
{
  # nix-darwin options: https://daiderd.com/nix-darwin/manual/index.html
  # https://github.com/LnL7/nix-darwin/blob/master/tests/system-defaults-write.nix
  # system packages
  environment.systemPackages = with pkgs; [
    vim
    git
    nix-prefetch-docker
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

  system.defaults = import ./config/nix/defaults.nix;

  # https://developer.apple.com/library/archive/technotes/tn2450/_index.html#//apple_ref/doc/uid/DTS40017618-CH1-KEY_TABLE_USAGES
  # python3 -c '(lambda srcId, dstId: print(0x700000000^srcId, 0x700000000^dstId))'
  # hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000065,"HIDKeyboardModifierMappingDst":0x7000000E7}]}'
  system.keyboard = {
    enableKeyMapping = true;
    # keyboard product name = {
    #   keyboard options
    #   swapLeftCommandAndLeftAlt = true;
    # };
  };


  # services
  services = {

    skhd = import ./config/nix/skhd.nix { enable = true; package = pkgs.skhd; };
    yabai = import ./config/nix/yabai.nix { enable = true; package = pkgs.yabai; };

  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
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
      "minecraft"
      "olive"
      "steam"
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
