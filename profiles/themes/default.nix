{pkgs, ...}: {
  home.packages = with pkgs; [
    yaru-theme
    yaru-remix-theme
    orchis-theme
  ];
}
