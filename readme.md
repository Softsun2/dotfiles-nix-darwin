# M1 Nix Darwin (pure)

## Philosophy

I spend too much time configuring unstable applications. I require more knowledge about the technologies I'm actually using.

### Software

-   Minimize distracting/tedious/configuration-sink-hole software.
-   Practice using robust software.
-   Practice understanding software.
-   Practice effective software usage.

### System

-   Learn how to administer a system.
    -   Networking
    -   Security
    -   Ssh
-   Modular, intuitive, understand nix management.
-   Respect operating system capabilities, especially UI capabilities.
-   Practice stability.
-   Practice extendability.
-   Practice simplicity.
-   Practice management/control.

## Workflow

I desire an intentional and static development environment.

## Todo

-   [ ] Submit to MacOS
    -   [ ] Single theme (for apps where the theming is trivial) with light/dark variant. If possible, the **only** runtime theming should be [toggling light and dark mode system-wide](https://grrr.tech/posts/2020/switch-dark-mode-os/).
    -   [X] One persistent bg.
    -   [X] Satisfactory nix-darwin system configurations ([See notes](./notes/nix-darwin-system-defaults.md)). Attempt to eliminate any imperative system configurations.
    -   [X] Use MacOS applications for non-cross-platform applications whenever possible. The built-in terminal app is terrible *but* it does enough. If it comes to it alacritty looks like a simple alternative.
    -   [X] Investigate the least effort-effective multitasking (looks like yabai is better than no yabai) -- using yabai.
-   [ ] Implement philosophies with Nix.
    -   [ ] Understand the ecosystem better.
    -   [X] Modular/Importable config.
    -   [ ] Understand network and ssh options.
    -   [ ] Configurations shouldn't rely on flakes or home-manager unless I genuinely believe in and understand their benefits.
    -   [X] Stable inputs. **Need a way to stay up to date with new releases though...**
    -   [X] Manage/clean profiles and versions; optimize the nix-store.
    -   [ ] Test sytem/user builds.
-   [ ] Effective, stable development tools.
    -   [ ] Learn emacs. Org-mode with org-roam.
    -   [ ] Core cross-platform tools.
    -   [ ] Core cross-platform productivity software.
    -   [ ] In editor learning (copilot/tldr alternative).
    -   [ ] Intentional browser experience.
    -   [X] Manage user **data** (file) structure with Nix
    -   [ ] Investigate syncing vs version control (keep mobile devices in mind).

## Notes

-   [Nix-darwin system defaults (preferences)](./notes/nix-darwin-system-defaults.md)
-   [Home Manager and Home Dir](./notes/home-manager-home-dir.md)
