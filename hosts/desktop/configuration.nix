{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Hardware-specific configuration
    ./hardware-configuration.nix

    # Desktop environment profile
    ../../profiles/desktop/gnome
    # ../../profiles/desktop/niri

    # System-wide profiles
    ../../profiles/desktop/gaming

    # Modularized configuration
    ./boot.nix
    ./fonts.nix
    ./hardware.nix
    ./networking.nix
    ./services.nix
    ./users.nix
  ];

  # Basic system settings
  nix.settings.experimental-features = ["nix-command" "flakes"];
  nix.extraOptions = ''
    keep-outputs = true
  '';
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "21.05";

  # Internationalisation
  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Security
  nix.settings.allowed-users = ["@wheel"];
  security.sudo.execWheelOnly = true;

  # Environment variables
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # Home Manager configuration
  home-manager.users.emil = {
    imports = [
      ../../common
      ../../profiles/cli
      ../../profiles/dev
      ../../profiles/desktop
      ../../profiles/themes
      ../../profiles/lang-servers
    ];

    home = {
      username = "emil";
      homeDirectory = "/home/emil";
      stateVersion = "24.05";
    };

    programs.home-manager.enable = true;
  };
}
