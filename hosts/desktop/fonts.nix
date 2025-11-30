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
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.iosevka
  ];
  fonts.fontconfig.subpixel.rgba = "rgb";
}
