# M1 Nix Darwin Todo List

## Docs
Need to install brew manually, can't do so with nix

## Packages
Override nix pkgs to include x86 builds of packages not available on aarch

## MacOS
Make a pr to add [this](1) to nix-darwin.

### Terminal
* zsh
  * fix "no file or dir: hm-session-vars.sh" when opening new zsh
* tmux
  * fzf into tmux session
    * use case: less frequent workspaces
  * tmux sessionizer
    * use case: frequent workspaces i.e., dotfiles, current projects, research, etc...
    * pin sessions to tags like dwm
  * custom key binds (learn use cases first)
* fzf
* setup [kitty](https://sw.kovidgoyal.net/kitty/#)
  * ✅ unmap all unnecessary binds 
  * startup options
  * additional config
    * buildtime and runtime config files are cool!
* cheat sheet script

### Home Environment
* hotkey daemon?
* program launcher or figure out nix & ~/Applications
* yabai wm?
* ✅ figure out system-wide fonts
* fix rebuild alias (leaving result link in working dir)

### NeoVim
* simple, functional, minimal mental overhead
  * fzf
  * telescope
  * treesitter
  * harpoon

[1]: https://www.mackungfu.org/UsabilityhackClickdraganywhereinmacOSwindowstomovethem
