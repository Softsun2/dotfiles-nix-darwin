{ config, pkgs, mypkgs, ... }:
let
  typescript-language-server-fixed = pkgs.symlinkJoin {
    name = "typescript-language-server";
    paths = [ pkgs.nodePackages.typescript-language-server ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/typescript-language-server \
        --add-flags --tsserver-path=${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib/
    '';
  };
in
{
  manual.manpages.enable = false;

  # home-manager configuration appendix:
  # https://rycee.gitlab.io/home-manager/options.html

  programs.home-manager.enable = true;

  home.packages = [
    pkgs.shellcheck
    pkgs.fontconfig
    pkgs.optifine
    pkgs.neofetch

    pkgs.taskwarrior

    pkgs.mysql
    pkgs.yt-dlp
    # xd
    pkgs.cmatrix

    # eye candy
    mypkgs.flavours
    pkgs.exa
    pkgs.feh
    pkgs.htop

    # applications
    pkgs.zathura

    # terminal workflow
    pkgs.tldr
    pkgs.jq
    pkgs.tree
    pkgs.inetutils
    pkgs.hexd

    # node stuff
    pkgs.nodejs
    pkgs.nodePackages.live-server
    pkgs.nodePackages.nodemon

    # programming lanuages
    pkgs.ocaml
    pkgs.ocamlPackages.utop
    pkgs.ocamlPackages.findlib
    pkgs.ocamlPackages.bitstring
    pkgs.ocamlPackages.ppx_bitstring
    # pkgs.rWrapper.override{ packages = with pkgs.rPackages; [ ggplot2 dplyr xts ]; }
  ];

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    initExtra = ''
      # shell scripts
      export PATH=$HOME/.dotfiles/bin:$PATH
      # bar script
      # export PATH=$HOME/suckless/dwm/bar:$PATH
      # set vim as default editor
      EDITOR="vim"

      # Basic auto/tab complete
      autoload -U compinit
      zstyle ':completion:*' menu select
      zmodload zsh/complist
      compinit
      #include hidden files in completions
      _comp_options+=(globdots)

      # Single line prompt
      AGKOZAK_MULTILINE=0

      # vi mode
      bindkey -v
      export KEYTIMEOUT=2
      
      # source fzf colors
      source ~/.dotfiles/theme/fzf/theme

      # Edit line in $EDITOR with ctrl-e:
      autoload edit-command-line; zle -N edit-command-line
      bindkey '^e' edit-command-line

      # falvours config location
      export FLAVOURS_CONFIG_FILE=$HOME/.dotfiles/config/flavours/config.toml

      bindkey '^y' autosuggest-accept
      bindkey -s '^f' 'f\n'

      # gd function
      gd () {
        cd "$(git rev-parse --show-toplevel)"/"$1"
      }

      solar-system
    '';

    profileExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';

    history = {
      save = 1000;
      size = 1000;
      path = "$HOME/.cache/zsh_history";
    };

    enableAutosuggestions = true;

    shellAliases = {
      ls  = "exa --icons";
      l   = "ls -l";
      ll  = "ls -la";
      c   = "clear";
      f   = "cd $(find . -type d | fzf)";
      s   = "kitty +kitten ssh";
      cdf = "cd $(find . -type d | fzf)";
      dotfiles = "cd ~/.dotfiles";
      school = "cd $(find ~/school -type d | fzf)";

      shell = "nix-shell";
      home = "vim $HOME/.dotfiles/home.nix";
      build-home = "nix build -o ~/.dotfiles/result ~/.dotfiles/.#homeManagerConfigurations.softsun2.activationPackage && $HOME/.dotfiles/result/activate";
      flake = "vim $HOME/.dotfiles/flake.nix";
      config = "vim $HOME/.dotfiles/configuration.nix";
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
    escapeTime = 50;
    terminal = "screen-256color";
    extraConfig = ''
      set-option -g status-position bottom
      set -g status-bg black 
      set -g status-fg blue 
    '';
    plugins =  with pkgs; [
      tmuxPlugins.cpu
      # {
      #   plugin = tmuxPlugins.resurrect;
      #   extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      # }
      # {
      #   plugin = tmuxPlugins.continuum;
      #   extraConfig = ''
      #     set -g @continuum-restore 'on'
      #     set -g @continuum-save-interval '15' # minutes
      #   '';
      # }
    ];
  };

  programs.kitty = {
    enable = true;
    settings = {
      allow_remote_control = true;
      cursor = "none";
      font_family = "Iosevka Nerd Font Mono";
      font_size = 16;
      scrollback_lines = 5000;
      wheel_scroll_multiplier = 3;
      window_padding_width = 10;
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
      hide_window_decorations = "titlebar-only";
      disable_ligatures = "never";
      background_opacity = "0.96";
    };
    extraConfig = ''
      # run time colors
      include ~/.dotfiles/theme/kitty/theme.conf

      # minimize functionality
      # clear_all_shortcuts yes
      # clear_all_mouse_actions yes

      # the few shortcuts & mouse actions I actually want

      # modifying fontsize
      # map cmd+equal change_font_size all +1.0
      # map cmd+minus change_font_size all -1.0

      # copy and pasting (mac)
      # map cmd+c copy_to_clipboard
      # fix paste
      # map cmd+v paste

      # clicking links
    '';
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;

    # comment

    # written in vim script
    extraConfig = ''
      lua << EOF
        vim.opt_local.runtimepath:prepend('/Users/softsun2/.dotfiles/config/nvim/lua')
      EOF
      luafile ~/.dotfiles/config/nvim/lua/init.lua
    '';

    plugins = with pkgs.vimPlugins; [

      ( nvim-treesitter.withPlugins (
        plugins: with plugins; [
          tree-sitter-nix
          tree-sitter-lua
          tree-sitter-bash
          tree-sitter-c
          tree-sitter-cpp
          tree-sitter-make
          tree-sitter-python
          tree-sitter-html
          tree-sitter-css
          tree-sitter-json
          tree-sitter-ocaml
          tree-sitter-javascript
        ]
      ))
      nvim-ts-rainbow
      lualine-nvim

      vim-pug

      gitsigns-nvim

      vim-illuminate

      nvim-lspconfig          # lsp
      lspsaga-nvim            # better lsp ui

      telescope-nvim          # integrated fuzzy finder
      plenary-nvim

      harpoon                 # Tagged files
      nvim-tree-lua           # file tree
      vim-floaterm            # floating terminal

      nvim-web-devicons       # dev icons
      indent-blankline-nvim
      vim-nix                 # nix

      nvim-navic

      # nvim-autopairs
      nvim-autopairs
      nvim-ts-autotag

      # snippets
      luasnip                 # snippet engine
      friendly-snippets       # more snippets

      # schemeing
      nvim-base16             # base16 color schemes w/ lsp & treesitter support
      vim-monokai
      nvim-solarized-lua
      rose-pine
      everforest

      # completions
      nvim-cmp                # completions
      cmp-buffer              # completion source: buffer
      cmp-path                # completion source: file path
      cmp-nvim-lua            # completion source: nvim config aware lua
      cmp-nvim-lsp            # completion source: lsp
      cmp-cmdline             # completion source: cmdline
      cmp_luasnip             # completion source: luasnip snippets
      lspkind-nvim            # pictograms for completion suggestions
      colorizer               # color name highlighter
    ];

    extraPackages = with pkgs; [
      # language servers
      rnix-lsp
      sumneko-lua-language-server
      nodePackages.pyright
      nodePackages.vscode-langservers-extracted
      nodePackages.typescript
      typescript-language-server-fixed
      ocamlPackages.ocaml-lsp
      rPackages.languageserver
      ccls

      # telescope depency
      ripgrep
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

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      ms-python.python
      ms-python.vscode-pylance
      llvm-vs-code-extensions.vscode-clangd
      ocamllabs.ocaml-platform
      timonwong.shellcheck
      zhuangtongfa.material-theme
      jnoortheen.nix-ide
      ms-vscode-remote.remote-ssh
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

}
