{
  config,
  pkgs,
  ...
}: {
  programs.niri.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-wlr];
  };

  security.polkit.enable = true;
  security.pam.services.swaylock = {};

  environment.systemPackages = with pkgs; [
    xdg-utils # for xdg-open to work
    alacritty
    fuzzel
    swaylock
    waybar
    xwayland-satellite
    mako
    swaybg
  ];
}
