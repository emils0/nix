{ config, pkgs, ... }:

let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in

let
  nix-gaming = builtins.fetchTarball
    "https://github.com/fufexan/nix-gaming/archive/master.tar.gz";
in

{
  imports = [
    "${home-manager}/nixos"
    "${nix-gaming}/modules/pipewireLowLatency.nix"
    ./nixos/hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home-manager.users.emil = { pkgs, ... }: {
    imports = [
      ./nixos/packages.nix
      ./common
    ];

    programs.zoxide = {
      enable = true;
      options = [ "--cmd s" ];
    };

    programs.home-manager.enable = true;
    nixpkgs.config.allowUnfree = true;

    home = {
      username = "emil";
      homeDirectory = "/home/emil";
      stateVersion = "21.11";
    };

    # programs.emacs = {
    #   enable = true;
    #   package = pkgs.emacsNativeComp;
    #   extraPackages = (epkgs: [ epkgs.vterm ]);
    # };

    # services.emacs.enable = true;

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    programs.java.enable = true;

    programs.chromium = {
      enable = true;
      package = pkgs.ungoogled-chromium;
      commandLineArgs = [ "--force-dark-mode" "--enable-features=WebUIDarkMode" ];
    };
  };

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "CascadiaCode" ]; })
    fira-code
    tamzen
    terminus_font
    work-sans
    iosevka-bin
    overpass
    lato
  ];


  nix.extraOptions = ''
    keep-outputs = true
  '';

  # security
  nix.settings.allowed-users = [ "@wheel" ];
  security.sudo.execWheelOnly = true;

  services.flatpak.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.nameservers = [ "91.239.100.100" "89.233.43.71" ];

  # Set your time zone.
  time.timeZone = "Europe/Copenhagen";

  # enable dhcp
  networking.interfaces.enp2s0.useDHCP = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.fstrim.enable = true;

  xdg.portal.enable = true;

  services.xserver.displayManager.gdm.wayland = false;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # enable latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable propietary NVIDIA drivers
  hardware.nvidia.modesetting.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable sound.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    lowLatency.enable = true;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;

  hardware.steam-hardware.enable = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = false;

  # use Colemak-DH
  services.xserver = {
    layout = "us,dk";
    # xkbVariant = "colemak_dh,";
    xkbOptions = "grp:shifts_toggle";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.emil = {
    isNormalUser = true;
    initialPassword = "Kode1234";
    extraGroups = [ "wheel" "libvirt" ];
  };

  boot.kernelModules = [ "kvm-intel" ];

  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;

  users.users.emil.shell = pkgs.fish;

  system.stateVersion = "21.05";

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome.cheese
    gnome-photos
    gnome.gnome-music
    gnome.gnome-terminal
    gnome.gedit
    gnome.epiphany
    gnome.totem
    gnome.tali
    gnome.iagno
    gnome.hitori
    gnome.atomix
  ];

  environment.systemPackages = with pkgs; [
    gnomeExtensions.dash-to-dock
  ];
}
