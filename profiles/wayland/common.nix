{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-clipboard # Wayland clipboard utilities
    brightnessctl # Screen brightness control
    pamixer # PulseAudio mixer
    playerctl # Media player control
    grim # Screenshot utility
    slurp # Screen area selection
  ];
}
