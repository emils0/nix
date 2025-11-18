{pkgs, ...}: {
  services.skhd = {
    enable = false;
    package = pkgs.skhd;

    skhdConfig = ''
      ctrl - t : wezterm
    '';
  };
}
