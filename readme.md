# NixOS config

Steps to install:

1. Install NixOS a drive with EFI enabled, choose the no desktop setting when selecting an environment.
2. When installation is finished, you must install Git on the system. Do so my either using the command `nix-shell -p git` or by quickly editing the base configuration with `sudo nano /etc/nixos/configuration.nix` and add git to the packages. I recommend adding (neo)vim too.
3. Rebuild the config like so: `sudo nixos-rebuild switch`
4. navigate to your home directory and clone this repo `git clone https://github.com&mikkurogue/nixos`
5. Move the hardware-configuration.nix that is generated for you to the repo directory like so `sudo mv /etc/nixos/hardware-configuration.nix ~/nixos/hosts/default` (personally I always place my nix config into the home dir `~/nixos`)
6. rebuild the config and switch to it: `sudo nixos-rebuild switch --flake ~/nixos#default`, await the build of the fresh packages.
7. reboot the machine with `reboot` and login. Choose your DE at the bottom of the SDDM login screen for plasma6 or hyprland.