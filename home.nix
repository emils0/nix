{config, pkgs, ...}:

{
home = {
username = "emil";
homeDirectory = "/home/emil";
  stateVersion = "22.11";
  };

programs.home-manager.enable = true;

  programs.git.enable = true;

  imports = [
    ./common
  ];
}