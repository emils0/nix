{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    intel-one-mono
    fira-code
    tamzen
    terminus_font
    work-sans
    iosevka-bin
    overpass
    lato
  ];
  fonts.fontconfig.subpixel.rgba = "rgb";
}
