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

  # home-manager configuration appendix:
  # https://rycee.gitlab.io/home-manager/options.html

  programs.home-manager.enable = true;

  home.packages = [
    # xd
    pkgs.cmatrix

    # eye candy
    mypkgs.flavours
    pkgs.exa
    pkgs.feh

    # applications
    pkgs.zathura

    # terminal workflow
    pkgs.tldr
    pkgs.fzf
    pkgs.jq
    pkgs.tree
    pkgs.nodePackages.live-server

    # ?
    pkgs.nodejs

    # programming lanuages
    pkgs.ocaml
    pkgs.ocamlPackages.utop
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

      # vi mode
      bindkey -v
      export KEYTIMEOUT=2

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
      dotfiles = "cd ~/.dotfiles";

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
      font_family = "JetBrains Mono";
      font_size = 20;
      scrollback_lines = 5000;
      wheel_scroll_multiplier = 3;
      window_padding_width = 10;
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
      hide_window_decorations = "titlebar-only";
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
        ]
      ))
      nvim-lspconfig          # lsp

      telescope-nvim          # integrated fuzzy finder
      plenary-nvim

      harpoon                 # Tagged files
      nvim-tree-lua           # file tree
      vim-floaterm                # floating terminal

      nvim-web-devicons       # dev icons
      indent-blankline-nvim
      vim-nix                 # nix

      luasnip                 # snippet engine
      friendly-snippets       # more snippets
      # nvim-autopairs

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
