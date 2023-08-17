# Home Manager and the Home Directory

My home directory has been a mess and recently I've desired some organization with the following properties:
-   Isolate (by location not access) personal data from program data. Clear seperation of my data and program data means less clutter and more focused file syncing if I decide to do so.
-   A garbage collect downloads directory
-   Maybe one day declare **all** my home directories as flakes or packages.

My solution for now is to [restructure the XDG user directories with home manager](#xdg-and-home-manager) to isolate my personal data.

## XDG

XDG manages the environment variables responsible for locating conventional user (home) directories such as `Downloads`, `Pictures`, `Public`, etc... These environment variables can be modified to implement a custom XDG user directories structure.

### XDG and Home Manager

Home manager provides an [option](https://rycee.gitlab.io/home-manager/options.html#opt-xdg.enable) to configure XDG. For example I restructure my XDG user directories with:
```Nix
#home.nix
xdg = {
 22     enable = true;
 23     userDirs = {
 24       enable = true;
 25       createDirectories = true;
 26 
 27       desktop = "${config.home.homeDirectory}/desktop";
 28       downloads = "${config.home.homeDirectory}/downloads";
 29       # I have no use for these right now
 30       # publicShare = "${config.home.homeDirectory}/public";
 31       # templates = "${config.home.homeDirectory}/templates";
 32       
 33       # explicitly user data
 34       documents = "${config.home.homeDirectory}/${home.username}/documents";
 35       videos = "${config.home.homeDirectory}/${home.username}/videos";
 36       music = "${config.home.homeDirectory}/${home.username}/music";
 37       pictures = "${config.home.homeDirectory}/${home.username}/pictures";
 38     };
 39   };
```
