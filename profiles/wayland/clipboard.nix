{pkgs, ...}: {
  home.packages = with pkgs; [
    cliphist # Clipboard history manager with fuzzel integration
    wl-clip-persist # Keeps clipboard content alive after app closes
  ];
}
