{
  config,
  pkgs,
  ...
}: {
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri-unstable;

  # Use GDM as the display manager
  services.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  programs.xwayland.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gnome];
  };

  security.polkit.enable = true;
  security.pam.services.swaylock = {};

  environment.systemPackages = with pkgs; [
    xdg-utils # for xdg-open to work
    alacritty
    fuzzel
    mako
    swaybg
    blueman # Bluetooth management
    pavucontrol # PulseAudio/PipeWire volume control
    gnome-connections # VNC/RDP client
    nautilus # GNOME Files (GUI file manager)
    hyprpicker # Color picker for Wayland
  ];

  # Home-manager configuration for Niri
  home-manager.users.emil = {
    imports = [
      # Niri-specific configuration
      ./config.nix
      ./styling.nix
      ./keybindings.nix

      # Wayland-generic configuration
      ../../wayland/common.nix
      ../../wayland/lock-idle.nix
      ../../wayland/gammastep.nix
      ../../wayland/notifications.nix
      ../../wayland/clipboard.nix
      ../../wayland/screenshots.nix
      ../../wayland/recording.nix
      ../../wayland/waybar/niri.nix
    ];
  };
}
