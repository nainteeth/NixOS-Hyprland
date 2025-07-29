{ config, lib, pkgs, inputs,  ... }:
{
  imports =
    [];
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  # Enable networking
  networking.networkmanager.enable = true;
  # Enable Wifi
  networking.wireless.userControlled.enable = true;
  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_DE.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true; # MACH DAS NICHT AUS

  # Enable Hyprland 
  programs.hyprland.enable = true;
  # Hint electron apps to use wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
 
  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this (What are Jack applications???)
    #jack.enable = true;

    # Maybe useless?? I dont know what it does:
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;

  # Define a user account.
  users.users.nainteeth = {
    isNormalUser = true;
    description = "nainteeth";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    # useless user packages 
    ];
  };

  # Enable automatic login for the user.
  #services.displayManager.autoLogin.enable = true;
  #services.displayManager.autoLogin.user = "nainteeth";

  services.displayManager.sddm = {
    enable = true;
    enableWayland = true;
    theme = "sddm-astronaut";
      settings = {
        #Theme = {
          #Background = "/path/to/your/awesome-wallpaper.png";
        #};
      };
  };

  # Sudo with no password
  security.sudo.wheelNeedsPassword = lib.mkForce false;

# Packages installed as a NixOS module system wide. Always prefer to install packages as modules rather than simple systemPackages:
  # Install firefox.
  programs.firefox.enable = true;
  # Install flatpak.
  services.flatpak.enable = true;
  # Install XDG Desktop Portal. 
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-hyprland
  ];

# Packages installed as systemPackages that dont require declarative configuration management using home-manager:
  environment.systemPackages = with pkgs; [
    kitty
    wofi # change to home manager
    kdePackages.dolphin
    unzip
    nwg-dock-hyprland # figure out how to use custom css
    # Cursor stuff i think
    nwg-look
   
    #lutris 
    inputs.zen-browser.packages."${system}".default  
    fastfetch
    pavucontrol
    adwaita-icon-theme
    networkmanagerapplet
    hyprpaper
    waypaper
    discord-ptb
    keepassxc
    signal-desktop
    spotify
    sddm-astronaut
  ];

 # Nerd Fonts
  fonts.packages = builtins.filter (pkg: lib.isDerivation pkg) (builtins.attrValues pkgs.nerd-fonts);

 # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  system.stateVersion = "25.05";
}
