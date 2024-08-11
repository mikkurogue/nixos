{ pkgs, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "spotify"
  ];
  
  environment.systemPackages = with pkgs; [ 
    spotify
  ];
}
