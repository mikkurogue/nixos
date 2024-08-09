{ pkgs, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "vscode"
  ];
  
  environment.systemPackages = with pkgs; [ 
    vscode
  ];
}
