{ config, pkgs, mypkgs, ... }:
{

  # home-manager configuration appendix:
  # https://rycee.gitlab.io/home-manager/options.html

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # xd
    cmatrix

    # terminal eye candy
    exa

    # terminal workflow
    tldr
    fzf

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

      # auto-attatch to tmux session
      # tmux a
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
      gd  = "cd $(git rev-parse --show-toplevel)/";

      shell = "nix-shell";
      home = "vim $HOME/.dotfiles/home.nix";
      build-home = "nix build -o ~/.dotfiles/result ~/.dotfiles/.#homeManagerConfigurations.softsun2.activationPackage && $HOME/.dotfiles/result/activate";
      flake = "vim $HOME/.dotfiles/flake.nix";
      config = "vim $HOME/.dotfiles/configuration.nix";
      rebuild = "darwin-rebuild switch --flake ~/.dotfiles";
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
      font_family = "JetBrains Mono";
      font_size = 12;
      scrollback_lines = 5000;
      wheel_scroll_multiplier = 3;
      window_padding_width = 10;
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
      hide_window_decorations = "titlebar-only";
    };
    extraConfig = ''
      # run time colors
      include ~/.dotfiles/config/kitty/theme.conf

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
      luafile $HOME/.dotfiles/config/nvim/lua/init.lua
    '';

    plugins = [
      pkgs.vimPlugins.nvim-treesitter         # better highlighting, indentation, and folding
      pkgs.vimPlugins.nvim-lspconfig          # lsp

      pkgs.vimPlugins.telescope-nvim          # integrated fuzzy finder
      pkgs.vimPlugins.plenary-nvim

      pkgs.vimPlugins.harpoon
      pkgs.vimPlugins.nvim-tree-lua           # file tree

      pkgs.vimPlugins.nvim-web-devicons       # dev icons
      pkgs.vimPlugins.indent-blankline-nvim
      pkgs.vimPlugins.vim-nix                 # nix

      pkgs.vimPlugins.luasnip                 # snippets

      pkgs.vimPlugins.nvim-cmp                # completions
      pkgs.vimPlugins.cmp-buffer              # completion source: buffer
      pkgs.vimPlugins.cmp-path                # completion source: file path
      pkgs.vimPlugins.cmp-nvim-lua            # completion source: nvim config aware lua
      pkgs.vimPlugins.cmp-nvim-lsp            # completion source: lsp
      pkgs.vimPlugins.cmp-cmdline             # completion source: cmdline
      pkgs.vimPlugins.cmp_luasnip             # completion source: luasnip snippets
      pkgs.vimPlugins.lspkind-nvim            # pictograms for completion suggestions
      pkgs.vimPlugins.colorizer               # color name highlighter

      mypkgs.vimPlugins.substrata-nvim        # substrata colorscheme
      mypkgs.vimPlugins.aquarium-vim          # aquarium colorscheme
      mypkgs.vimPlugins.vim-yami              # yami colorscheme
      mypkgs.vimPlugins.preto                 # preto colorscheme
      mypkgs.vimPlugins.candle-grey           # candle-grey colorscheme
    ]; 

    extraPackages = with pkgs; [
      # lsp parser compiler
      gcc

      # language servers
      rnix-lsp
      sumneko-lua-language-server
      nodePackages.pyright

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

}
