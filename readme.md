# Nix-Darwin and Nix packages on MacOS

This is my first look at using Nix-Darwin and Nix packages on MacOS. I'm hoping to fully migrate to the Nix environment (as much as I can given the current mac-nix conflicts) on MacOS. This repository will be merged with my [NixOS system configurations](https://github.com/Softsun2/dotfiles-NixOS) some time in the future, multiple system configuration from a single repository!

This is an example setup on the x86_64-darwin arch just to get my feet wet with nix on MacOS, my goal is to be able to bootstrap my nix environment on apple silicon.

# Bootstrapping [Nix-Darwin](https://github.com/LnL7/nix-darwin) for flakes

Below I walk through my steps for "bootstrapping" a very simple configuration with nix, nix-darwin, flakes, and home-manager.

## Steps
1. Install [nix](https://nixos.org/download.html) (I *believe* multiuser is the only supported version now)
2. Bootstrap nix-darwin. *"Since the installer doesn't work with flakes out of the box yet nix-darwin will need to be to be bootstrapped using the installer or manually."* <cite>[nix-darwin](https://github.com/LnL7/nix-darwin)</cite>. I *believe* this is no longer true but it's how I continued. The following commands run the installer.

        nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
        ./result/bin/darwin-installer

3. Enable flakes
	* Add the following line to `/etc/nix/nix.conf`

            experimental-features = nix-command flakes

	* Restart the nix daemon (if you have a multi-user install) with the following commands.

            sudo launctl stop org.nixos.nix-daemon
            sudo launctl start org.nixos.nix-daemon

	* Verify flakes are enabled by running `nix flake --help`.
4. Setup your flake, my outputs are a darwin configuration and a home-manager configuration. See my simple example configurations.
    * [flake.nix](flake.nix) - system and user configurations flake.
    * [configuration.nix](configuration.nix) - nix-darwin (system) configurations.
    * [home.nix](home.nix) - user configurations.
5. Resolve [override issue](https://github.com/LnL7/nix-darwin/issues/149) with `sudo mv /etc/nix/nix.conf /etc/nix/.nix-darwin.bkp.nix.conf`.
6. Build from the flake. In my case I build my system system and user configurations seperately.
    * Building my system. **Note**: The name you specify in your flake for your `darwinConfigurations` must match the name of your system. Since the path to my flake is `~/.dotfiles`, I build my system as follows:

            darwin-rebuild switch --flake ~/.dotfiles

    * Building my user configurations. **Note:**: The name you specify in your flake for your `homeManagerConfigurations` must match the name of the user you're configuring. Since my user name is `softsun2`, I build my system as follows:

            nix build ~/.dotfiles/.#homeManagerConfigurations.softsun2.activationPackage
            ~/.dotfiles/result/activate

7. Done! For subsequent rebuilds of your flake outputs I would reccomend making convience aliases of the previous commands.


# Following remarks
* GUI applications