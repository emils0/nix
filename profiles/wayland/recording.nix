{pkgs, ...}: {
  home.packages = with pkgs; [
    wl-screenrec # Modern, rust-based screen recorder for Wayland
  ];
}
