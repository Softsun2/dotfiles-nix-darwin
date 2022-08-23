{ config, pkgs, ... }:
{

  # home-manager configuration appendix:
  # https://rycee.gitlab.io/home-manager/options.html

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # terminal workflow
    tldr
    fzf
    
    # text editing
    rnix-lsp

    # applications
    # discord
  ];

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    initExtra = ''
      # shell scripts
      # export PATH=$HOME/.dotfiles/bin/:$PATH
      # bar script
      # export PATH=$HOME/suckless/dwm/bar:$PATH
      # set vim as default editor
      EDITOR="vim"
      
      # Single line prompt
      AGKOZAK_MULTILINE=0

      # Basic auto/tab complete
      autoload -U compinit
      zstyle ':completion:*' menu select
      zmodload zsh/complist
      compinit
      #include hidden files in completions
      _comp_options+=(globdots)

      # vi mode
      bindkey -v
      export KEYTIMEOUT=2

      # Edit line in $EDITOR with ctrl-e:
      autoload edit-command-line; zle -N edit-command-line
      bindkey '^e' edit-command-line

      bindkey '^y' autosuggest-accept
      bindkey -s '^f' 'f\n'
    '';

    history = {
      save = 1000;
      size = 1000;
      path = "$HOME/.cache/zsh_history";
    };

    enableAutosuggestions = true;

    shellAliases = {
      # ls  = "exa --icons";
      l   = "ls -l";
      ll  = "ls -la";
      c   = "clear";
      f   = "cd $(find . -type d | fzf)";

      shell = "nix-shell";
      home = "vim $HOME/.dotfiles/home.nix";
      build-home = "nix build -o ~/.dotfiles/result ~/.dotfiles/.#homeManagerConfigurations.softsun2.activationPackage && $HOME/.dotfiles/result/activate";
      flake = "vim $HOME/.dotfiles/flake.nix";
      config = "vim $HOME/.dotfiles/configuration.nix";
      rebuild = "darwin-rebuild switch --flake $HOME/.dotfiles";
    };

    plugins = [
      {
        name = "agkozak-zsh-prompt";
        file = "agkozak-zsh-prompt.plugin.zsh";
        src = builtins.fetchGit {
          url = "https://github.com/agkozak/agkozak-zsh-prompt";
          rev = "1906ad8ef2b4019ae8a1c04d539d7a3c4bde77cb";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        file = "zsh-syntax-highlighting.zsh";
        src = builtins.fetchGit {
          url = "https://github.com/zsh-users/zsh-syntax-highlighting";
          rev = "caa749d030d22168445c4cb97befd406d2828db0";
        };
      }
      {
        name = "zsh-you-should-use";
        file = "you-should-use.plugin.zsh";
        src = builtins.fetchGit {
          url = "https://github.com/MichaelAquilina/zsh-you-should-use";
          rev = "773ae5f414b296b4100f1ab6668ecffdab795128";
        };
      }
      {
        name = "zsh-colored-man-pages";
        file = "colored-man-pages.plugin.zsh";
        src = builtins.fetchGit {
          url = "https://github.com/ael-code/zsh-colored-man-pages";
          rev = "57bdda68e52a09075352b18fa3ca21abd31df4cb";
        };
      }
    ];
  };

  programs.tmux = {
    enable = true;
    prefix = "C-a";
    plugins =  with pkgs; [
      tmuxPlugins.cpu
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '15' # minutes
        '';
      }
    ];
  };

  programs.kitty = {
    enable = true;
    settings = {
      cursor = "none";
      # shell_integration = "no-cursor";
      # font_family = "JetBrains Mono";
      font_size = 14;
      scrollback_lines = 5000;
      wheel_scroll_multiplier = 3;
      window_padding_width = 5;
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
    };
    extraConfig = ''
      # run time colors
      include ~/.dotfiles/kitty/theme.conf

      # minimize functionality
      clear_all_shortcuts yes
      clear_all_mouse_actions yes

      # the few shortcuts & mouse actions I actually want

      # modifying fontsize
      map cmd+equal change_font_size all +2.0
      map cmd+minus change_font_size all -2.0

      # copy and pasting (mac)
      map cmd+c copy_to_clipboard
      # fix paste
      map cmd+v paste

      # clicking links
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

}
