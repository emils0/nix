{
  pkgs,
  zen-browser,
  ...
}: {
  imports = [
    zen-browser.homeModules.twilight
    ./zen-browser.nix
  ];
  home.packages = with pkgs; [
    celluloid
    # element-desktop
    insomnia
    keepassxc
    dino
    blanket
    tor-browser
    thunderbird
    transmission_4-gtk
    libreoffice-fresh
    gnome-boxes
    vesktop
    spotify
  ];
}
