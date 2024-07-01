{
  home = {
    username = "emil";
    homeDirectory = "/home/emil";
    stateVersion = "22.11";
  };

  programs.home-manager.enable = true;

  programs.git.enable = true;
  # programs.fish.enable = true;
  programs.bash.enable = true;
  targets.genericLinux.enable = true;

  imports = [
    ./common
    ./wsl/packages.nix
  ];

  # programs.eza.enable = true;

  programs.zoxide = {
    enable = true;
    options = ["--cmd s"];
    enableNushellIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
