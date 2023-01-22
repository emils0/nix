{pkgs, ...}: {
  services.skhd = {
    enable = true;
    package = pkgs.skhd;

    skhdConfig = ''
      ctrl - t : wezterm
    '';
  };
}
