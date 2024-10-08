{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  

  networking.hostName = "nixos"; # Define your hostname.

  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Internationalization settings.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fi_FI.UTF-8";
    LC_IDENTIFICATION = "fi_FI.UTF-8";
    LC_MEASUREMENT = "fi_FI.UTF-8";
    LC_MONETARY = "fi_FI.UTF-8";
    LC_NAME = "fi_FI.UTF-8";
    LC_NUMERIC = "fi_FI.UTF-8";
    LC_PAPER = "fi_FI.UTF-8";
    LC_TELEPHONE = "fi_FI.UTF-8";
    LC_TIME = "fi_FI.UTF-8";
  };

  # KDE as fallback
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Remove some optional deps from KDE
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    oxygen
    kate
  ];

  # Configure keymap in X11
  services.xserver.xkb.layout = "fi";
  services.xserver.xkb.variant = "winkeys";


  # Configure console keymap
  console.keyMap = "fi";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account.
  users.users.mikku = {
    isNormalUser = true;
    description = "mikku";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
    shell = pkgs.fish;
  };

  fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ]; })
];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "mikku" = import ./home.nix;
    };
  };
  home-manager.backupFileExtension = "backup";

  # Install firefox.
  programs.firefox.enable = true;
  programs.fish.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.hyprland.enable = true;
  programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    sl
    qt5.qtwayland
    kdePackages.qt6ct
    xdg-desktop-portal
    xdg-desktop-portal-gnome
    xdg-desktop-portal-hyprland
    hyprlock
    gtk3
    gtk4
    gtk2
    gnome.gnome-settings-daemon
    gsettings-desktop-schemas
    glib
    rose-pine-gtk-theme
    nwg-look
    gsettings-qt
    libnotify
    hyprpaper
    pavucontrol
  ];

  # System state version
  system.stateVersion = "24.05";
}

