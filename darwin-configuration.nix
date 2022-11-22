{ config, pkgs, lib, ... }:

let
  home-manager = builtins.fetchTarball
    "https://github.com/nix-community/home-manager/archive/master.tar.gz";

in

{
  imports = [
    "${home-manager}/nix-darwin"
    ./darwin/homebrew.nix
    # ./fish.nix
    # ./skhd.nix
  ];

  environment.variables = { EDITOR = "hx"; };

  users.users.emil.shell = pkgs.fish;
  programs.fish.enable = true;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  services.nix-daemon.enable = true;
  system.stateVersion = 4;

  security.pam.enableSudoTouchIdAuth = true;

  users.users.emil = {
    name = "emil";
    home = "/Users/emil";
  };

  home-manager.useUserPackages = true;

  home-manager.useGlobalPkgs = true;

  home-manager.users.emil = { pkgs, lib, ... }: {
    imports = [
      ./darwin/darwin-application-activation.nix
      ./darwin/packages.nix
      ./common
    ];

    programs.java.enable = true;
    programs.java.package = pkgs.temurin-bin;

    home.stateVersion = "22.11";
    nixpkgs.config.allowUnfree = true;

    programs.fish.enable = true;

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    programs.zoxide = {
      enable = true;
      options = [ "--cmd s" ];
    };
  };

  fonts.fontDir.enable = true;

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "CascadiaCode" ]; })
    fira-code
    tamzen
    work-sans
    iosevka-bin
    overpass
    julia-mono
  ];
}
