{ pkgs, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "discord"
  ];
  
  environment.systemPackages = with pkgs; [ 
    discord
  ];
}
