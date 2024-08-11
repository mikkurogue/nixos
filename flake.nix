{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

     home-manager = {
       url = "github:nix-community/home-manager";
       inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/default/configuration.nix
	      ./modules/packages/vscode.nix
        ./modules/packages/zed.nix
        ./modules/packages/discord.nix
        ./modules/packages/spotify.nix
        ./modules/glib-schema-fix.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
