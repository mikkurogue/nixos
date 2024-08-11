{ pkgs, ... }:
{ 
  environment.systemPackages = with pkgs; [ 
    go
    rustup
    typescript
    typescript-language-server
    gopls
  ];
}
