# M1 Nix Darwin Todo List


## Functional minimalism
Functional minimalism at first seems like an oxymoron. Acheiving this will take time, obviously in the short term I will have to err on the side of functionality at the expensive of minimalism. I simply don't have the time, knowledge, or experience to hack out a system with custom built/configured minimal tools yet.

I'm trying my best to start from scratch, adding features only as they're needed. In my eyes, a minimalist system means relying on a few core workflow features completely out of necessity. Where these features have little mental overhead, are very familiar, and can be modified to fit my use cases.

### Brainless workflow
I don't want to think about managing my workflow. I want to minimize tracking down wandering tabs, `cd`ing everywhere, initializing shell environments upon entering workspaces, shifting focus between multiple related windows, grabbing my mouse, and using software with different organization schemas.

Taking inspiration from most window managers, I would like to make a tag system my primary workflow pattern.

* dwm: A display has tags for screens (modkey + <num>)
* tmux: A tmux server has tags for sessions (^A + <num>)
* vim: A vim instance has tags for marked files (leader + <num>)

This is all concept, it appears simple, reactive, and efficient. In practice this may not be the most productive or ergonomic. A common tagging schema would need to be planned.

### Familiarity
I want to know exactly which tools are installed and how to use them. I want to know which tools can be modified and how to do so to meet my use conditions.

This is a lofty goal, it will take a lot of time and experience. I want to make an effort to make learning how to use these tools as easy as possible with things such as cht.sh, tldr, etc... (I haven't looked into this much yet)

### Minimalism (visual)
I enjoy how default software usually looks. Want to avoid the whole modern sleek look (dwm is too modern looking for me 😔). Also want to my system to feel unified and personalized. I don't think I will spend much time ricing themes. If I can I'll stick to a simple base16 color set and use it wherever I can.


## Packages
* Override nix pkgs to include x86 builds of packages not available on aarch

### Terminal
* zsh
  * fix "no file or dir: hm-session-vars.sh"
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

### Desktop Environment
* hotkey daemon?
* program launcher or figure out nix & ~/Applications
* yabai wm?

### NeoVim
* simple, functional, minimal mental overhead
  * fzf
  * telescope
  * treesitter
  * harpoon

### Obsidian ?
