{ config, pkgs, ... }:
{

  # home-manager configuration appendix:
  # https://rycee.gitlab.io/home-manager/options.html

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    rnix-lsp
  ];

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      ms-python.python
      ms-python.vscode-pylance
      llvm-vs-code-extensions.vscode-clangd
      ocamllabs.ocaml-platform
      timonwong.shellcheck
      jnoortheen.nix-ide
    ];
    keybindings = [
      # window movement
      {
          key = "ctrl+h";
          command = "workbench.action.focusLeftGroup";
      }
      {
          key = "ctrl+l";
          command = "workbench.action.focusRightGroup";
      }
      {
          key = "ctrl+j";
          command = "workbench.action.focusBelowGroup";
      }
      {
          key = "ctrl+k";
          command = "workbench.action.focusAboveGroup";
      }

      # diagnostics (tbd)

      # quick menu movement
      {
          key = "ctrl+j";
          command = "workbench.action.quickOpenSelectNext";
          when = "inQuickOpen";
      }
      {
          key = "ctrl+k";
          command = "workbench.action.quickOpenSelectPrevious";
          when = "inQuickOpen";
      }
      {
          key = "ctrl+c";
          command = "workbench.action.closeQuickOpen";
          when = "inQuickOpen";
      }

      # suggestions
      {
          key = "ctrl+y";
          command = "acceptSelectedSuggestion";
          when = "suggestWidgetVisible && textInputFocus";
      }
      {
          key = "ctrl+space";
          command = "toggleSuggestionDetails";
          when = "editorTextFocus && suggestWidgetVisible";
      }
      {
          key = "ctrl+j";
          command = "selectNextSuggestion";
          when = "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus";
      }
      {
          key = "ctrl+k";
          command = "selectPrevSuggestion";
          when = "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus";
      }
      {
          key = "ctrl+c";
          command = "editor.action.inlineSuggest.hide";
          when = "inlineSuggestionVisible";
      }

      # terminal
      {
          key = "ctrl+shift+j";
          command = "workbench.action.terminal.toggleTerminal";
          when = "terminal.active";
      }
    ];

  };

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

      shell = "nix-shell";
      home = "vim $HOME/.dotfiles/home.nix";
      apply = ''
        nix build $HOME/.dotfiles/.#homeManagerConfigurations.softsun2.activationPackage && \
        $HOME/.dotfiles/result/activate
      '';
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

  programs.git = {
    enable = true;
    userName = "softsun2";
    userEmail = "peyton.okubo13@gmail.com";
    extraConfig = {
      init = { defaultBranch = "main"; };
    };
  };

}
