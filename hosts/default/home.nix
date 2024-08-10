{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "mikku";
  home.homeDirectory = "/home/mikku";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.kitty
    pkgs.alacritty
    pkgs.gh
    pkgs.tmux
    pkgs.neovim
    pkgs.waybar
    pkgs.kdePackages.dolphin
    pkgs.rofi
    pkgs.wlogout
    pkgs.nwg-look
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
    home.file = {
    ".config/waybar/config" = {
      source = ../../configs/waybar/config.json;
    };
    ".config/wlogout/layout" = {
      source = ../../configs/wlogout/layout;
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #:
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/mikku/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  wayland.windowManager.hyprland = {
	enable = true;
	settings = {
	 "$mod" = "SUPER";
	 "$terminal" = "kitty";
   "$file" = "dolphin";
	 exec-once = "waybar";
	 bind = 
	 [
	   # App shortcuts
	   "$mod, F, exec, firefox"
	   "$mod, T, exec, $terminal"
     "$mod, E, exec, $file"
     # util
     "$mod, A, exec, rofi -show drun"
	   "$mod, Q, killactive"
     "$mod, L, exec, hyprlock"
     "Ctrl+Alt, W, exec, killall waybar || waybar" # toggle waybar
     # workspaces
	   "$mod, 1, workspace, 1"
	   "$mod, 3, workspace, 3"
     "$mod, 4, workspace, 4"
     "$mod, 5, workspace, 5"
     "$mod, 6, workspace, 6"
     "$mod, 7, workspace, 7"
     "$mod, 8, workspace, 8"
     "$mod, 9, workspace, 9"
     "$mod, 0, workspace, 10"
     "$mod+Ctrl+Alt, Right, movetoworkspace, r+1" #move window to relative right
     "$mod+Ctrl+Alt, Left, movetoworkspace, r-1" #move window to relative left

     
	 ];
   # Font stuff
   #exec = "";
	};
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
