{ config, pkgs, ... }:
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

  no-clown-fiesta-nvim = pkgs.callPackage ./pkgs/no-clown-fiesta-nvim.nix { inherit pkgs; };
  rasmus-nvim = pkgs.callPackage ./pkgs/rasmus-nvim.nix { inherit pkgs; };
  menguless-nvim = pkgs.callPackage ./pkgs/menguless-nvim.nix { inherit pkgs; };
in
{
  manual.manpages.enable = false;

  # home-manager configuration appendix:
  # https://rycee.gitlab.io/home-manager/options.html

  programs.home-manager.enable = true;

  home.packages = [
    pkgs.neovim-remote
    pkgs.go
    pkgs.shellcheck
    pkgs.fontconfig
    pkgs.optifine
    pkgs.neofetch
    pkgs.cowsay

    pkgs.ffmpeg

    pkgs.mysql
    pkgs.yt-dlp
    # xd
    pkgs.cmatrix
    pkgs.orca-c

    pkgs.flavours
    pkgs.exa
    pkgs.feh
    pkgs.htop

    # applications
    pkgs.zathura

    # terminal workflow
    pkgs.tldr
    pkgs.jq
    pkgs.tree
    pkgs.hexd

    # node stuff
    pkgs.nodejs
    pkgs.nodePackages.live-server
    pkgs.nodePackages.nodemon
    pkgs.nodePackages.ts-node

    # programming lanuages
    # pkgs.ocaml
    # pkgs.ocamlPackages.utop
    # pkgs.ocamlPackages.findlib
    # pkgs.ocamlPackages.bitstring
    # pkgs.ocamlPackages.ppx_bitstring
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
      better = "$EDITOR ~/better.md";
      jo = "$EDITOR ~/Documents/ditsy/jo.md";
      dotfiles = "cd ~/.dotfiles";
      school = "cd $(find ~/school -type d | fzf)";
      select-flavour = "select-flavour ; disable-window-shadow";
      # emacs = "/opt/homebrew/opt/emacs-plus@28/bin/emacs";
      # emacsclient = "/opt/homebrew/opt/emacs-plus@28/bin/emacsclient";

      shell = "nix-shell";
      home = "$EDITOR $HOME/.dotfiles/home.nix";
      build-home = "nix build -o ~/.dotfiles/result ~/.dotfiles/.#homeManagerConfigurations.softsun2.activationPackage && $HOME/.dotfiles/result/activate";
      flake = "$EDITOR $HOME/.dotfiles/flake.nix";
      config = "$EDITOR $HOME/.dotfiles/configuration.nix";
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
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.5.0";
          sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
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
      allow_remote_control = "socket-only";
      listen_on = "unix:/tmp/kitty";
      font_size = 16;
      scrollback_lines = 5000;
      wheel_scroll_multiplier = 3;
      window_padding_width = 10;
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
      hide_window_decorations = "titlebar-only";
      disable_ligatures = "never";
      background_opacity = "1";
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

      # this needs to be last!
      cursor none

      map cmd+plus change_font_size all +0.5
      map cmd+equal change_font_size all +0.5
      map shift+cmd+equal change_font_size all +0.5

      map cmd+minus change_font_size all -0.5
      map shift+cmd+minus change_font_size all -0.5
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

    plugins = [

      ( pkgs.vimPlugins.nvim-treesitter.withPlugins (
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

      pkgs.vimPlugins.zen-mode-nvim
      pkgs.vimPlugins.twilight-nvim
      pkgs.vimPlugins.nvim-ts-rainbow
      pkgs.vimPlugins.lualine-nvim

      pkgs.vimPlugins.nvim-base16
      pkgs.vimPlugins.vim-pug

      pkgs.vimPlugins.vim-clang-format

      pkgs.vimPlugins.gitsigns-nvim

      pkgs.vimPlugins.vim-illuminate

      pkgs.vimPlugins.nvim-lspconfig          # lsp
      pkgs.vimPlugins.lspsaga-nvim            # better lsp ui

      pkgs.vimPlugins.telescope-nvim          # integrated fuzzy finder
      pkgs.vimPlugins.plenary-nvim

      pkgs.vimPlugins.harpoon                 # Tagged files
      pkgs.vimPlugins.nvim-tree-lua           # file tree

      pkgs.vimPlugins.nvim-web-devicons       # dev icons
      pkgs.vimPlugins.indent-blankline-nvim
      pkgs.vimPlugins.vim-nix                 # nix

      pkgs.vimPlugins.nvim-navic

      pkgs.vimPlugins.nvim-autopairs
      pkgs.vimPlugins.nvim-ts-autotag

      pkgs.vimPlugins.luasnip                 # snippet engine
      pkgs.vimPlugins.friendly-snippets       # more snippets

      pkgs.vimPlugins.nvim-cmp                # completions
      pkgs.vimPlugins.cmp-buffer              # completion source: buffer
      pkgs.vimPlugins.cmp-path                # completion source: file path
      pkgs.vimPlugins.cmp-nvim-lua            # completion source: nvim config aware lua
      pkgs.vimPlugins.cmp-nvim-lsp            # completion source: lsp
      pkgs.vimPlugins.cmp-cmdline             # completion source: cmdline
      pkgs.vimPlugins.cmp_luasnip             # completion source: luasnip snippets
      pkgs.vimPlugins.lspkind-nvim            # pictograms for completion suggestions
      pkgs.vimPlugins.colorizer               # color name highlighter
      pkgs.vimPlugins.vim-prettier
    ];

    extraPackages = with pkgs; [
      # language servers
      rnix-lsp
      sumneko-lua-language-server
      nodePackages.pyright
      nodePackages.vscode-langservers-extracted
      nodePackages.typescript
      nodePackages.eslint
      nodePackages.prettier
      typescript-language-server-fixed
      # ocamlPackages.ocaml-lsp
      rPackages.languageserver
      ccls
      ltex-ls

      # telescope depency
      ripgrep
    ];
  };

  programs.firefox = {
    enable = true;
    package = pkgs.runCommand "firefox-0.0.0" { } "mkdir $out";
    profiles = {
      softsun2 = {
        id = 0;
        userChrome = builtins.readFile ./conf.d/userChrome.css;
        # extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        #   ublock-origin
        #   youtube-nonstop
        # ];
      };
    };
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
    defaultOptions = [ "--color=16" ];
  };

}
