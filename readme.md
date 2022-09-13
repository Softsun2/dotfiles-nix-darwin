# M1 Nix Darwin Todo List

## Docs
`Aarch` branch readme, go over bootstrapping steps including brew setup.

## Packages
Override nix pkgs to include x86 builds of packages not available on aarch.

❓ I looked into this, doesn't make a whole lot of sense to me how the override works and I wasn't able to get it to work. Just going to control brew for these packages instead.

## MacOS
* Make a pr to add [this](1) to nix-darwin?
* yabai wm
  * very slow
* hotkey daemon (skhd)
  * dwm like yabai keybinds
* program launcher or figure out nix & ~/Applications
* ✅ figure out system-wide fonts

### Command Line Env
* zsh
  * fix "no file or dir: hm-session-vars.sh" when opening new zsh
* tmux
  * unfuck tmux longlived sessions or script a sessionizer
  * fzf into tmux session
    * use case: less frequent workspaces
  * tmux sessionizer
    * use case: frequent workspaces i.e., dotfiles, current projects, research, etc...
    * pin sessions to tags like dwm
  * custom key binds (learn use cases first)
  * learn tmux cmds and config
    * vi mode for cmd line
* ✅ fzf
* setup [kitty](2)
  * unmap annoying binds
  * startup options
  * additional config
    * buildtime and runtime config files are cool!
* cheat sheet script?

### Home Environment
* fix rebuild alias (leaving result link in working dir)
* Cringe themeing:
  * theme script utilizing flavours
    * kitty
    * base16 neovim
    * firefox
    * zathura
    * tmux
    * ...

### NeoVim
* Banish vs-code to the shadow realm
* simple, functional, minimal mental overhead
  * ✅ fzf
  * ✅ telescope
  * ✅ treesitter
  * faster lsp-s?
  * harpoon

[1]: https://www.mackungfu.org/UsabilityhackClickdraganywhereinmacOSwindowstomovethem
[2]: https://sw.kovidgoyal.net/kitty/#
