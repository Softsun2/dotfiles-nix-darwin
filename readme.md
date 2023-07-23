# M1 Nix Darwin (pure) Todo List

## Philosophy

I spend way too much time configuring unstable applications. I have little knowledge about the technologies I'm actually using...

### Software

-   No distracting/tedious/configuration-sink-hole software.
-   Practice using robust software.
-   Practice understanding software.
-   Practice maximizing the capabilities of software.

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

My current workflow is a manifestation of my state of being. Fragile, distracted, and shallow.

I desire an intentional and static development environment. Where the feeling of incompleteness spawns from actual unfinished work and not a slew of applications with configurations slightly conflict with my mood.

## Todo

-   [ ] Submit to MacOS
    -   [ ] Single theme (for apps where the theming is trivial) with light/dark variant. The **only** runtime theming should be [toggling light and dark mode system wide](https://grrr.tech/posts/2020/switch-dark-mode-os/), if possible.
    -   [ ] One persistent bg.
    -   [ ] Satisfactory nix-darwin system configurations ([See notes](./notes/nix-darwin-system-defaults.md)). Attempt to eliminate any imperative system configurations.
    -   [ ] Use MacOS applications for non-cross-platform applications whenever possible.
    -   [ ] Investigate least effort effective multitasking (might fallback to a minimal yabai conf).
-   [ ] Implement philosophies with Nix.
    -   [ ] Understand the ecosystem better.
    -   [ ] Modular config.
    -   [ ] Understand network and ssh options.
    -   [ ] Configurations shouldn't rely on flakes or home-manager unless I truly believe in and understand their benefits.
    -   [ ] Stable inputs.
    -   [ ] Manage/clean profiles and versions.
-   [ ] Effective, stable development tools.
    -   [ ] Learn emacs. Org mode!
    -   [ ] Core cross-platform tools.
    -   [ ] Core cross-platform productivity software.
    -   [ ] In editor learning (copilot/tldr alternative)
    -   [ ] Intentional browser experience.
    -   [ ] Investigate syncing vs version control (keep mobile devices in mind).

## Notes

-   [Nix-darwin system defaults (preferences)](./notes/nix-darwin-system-defaults.md)
