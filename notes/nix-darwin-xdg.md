# Home Manager and the Home Directory

My home directory has been a mess and recently I've desired some organization with the following property:
-   Isolate (by location not access) personal data from program data. Clear seperation of my data and program data means less clutter and more focused file syncing if I decide to do so.

## XDG

XDG manages the environment variables responsible for locating conventional user (home) directories such as `Downloads`, `Pictures`, `Public`, etc... These environment variables can be modified to implement a custom XDG user directory structure.

### XDG and Home Manager (On XDG supported platforms)

Home manager provides an [option](https://rycee.gitlab.io/home-manager/options.html#opt-xdg.enable) to configure XDG. For example I could restructure my XDG user directories with:
```Nix
#home.nix
xdg = {
     enable = true;
     userDirs = {
       enable = true;
       createDirectories = true;
 
       desktop = "${config.home.homeDirectory}/desktop";
       downloads = "${config.home.homeDirectory}/downloads";
       # I have no use for these right now
       # publicShare = "${config.home.homeDirectory}/public";
       # templates = "${config.home.homeDirectory}/templates";
       
       # explicitly user data
       documents = "${config.home.homeDirectory}/${home.username}/documents";
       videos = "${config.home.homeDirectory}/${home.username}/videos";
       music = "${config.home.homeDirectory}/${home.username}/music";
       pictures = "${config.home.homeDirectory}/${home.username}/pictures";
     };
   };
```

### XDG, Home Manager, and MacOS

However XDG is not supported on MacOS. Furthermore MacOS's semantic directory structure is annoyingly baked into the operating system and as far as I know not something that can be changed, even as root. Making isolated semantic directories visible to applications would require some form of wrapping. For now I "partition" my user data from program data within my home directory with:
```Nix
#home.nix
home.file."${config.home.username}/archive/.keep".text = "";
home.file."${config.home.username}/dev/.keep".text = "";
home.file."${config.home.username}/documents/.keep".text = "";
home.file."${config.home.username}/literature/.keep".text = "";
home.file."${config.home.username}/music/.keep".text = "";
home.file."${config.home.username}/pictures/.keep".text = "";
home.file."${config.home.username}/projects/.keep".text = "";
home.file."${config.home.username}/school/.keep".text = "";
home.file."${config.home.username}/videos/.keep".text = "";
home.file."${config.home.username}/writing/.keep".text = "";
```
