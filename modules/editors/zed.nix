{ pkgs, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "zed-editor"
  ];
  
  environment.systemPackages = with pkgs; [ 
    zed-editor
  ];
}
