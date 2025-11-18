{
  config,
  pkgs,
  ...
}: {
  imports = [./packages.nix];
  # Wayland + GNOME
  services = {
    displayManager.gdm = {
      enable = true;
      wayland = true;
      autoSuspend = true;
    };
    desktopManager.gnome.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gnome];
  };

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-photos
    gnome-music
    gnome-terminal
    gedit
    epiphany
    totem
    tali
    iagno
    hitori
    atomix
  ];
}
