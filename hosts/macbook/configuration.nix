{
  pkgs,
  profiles,
  common,
  ...
}: {
  imports = [
    ./homebrew.nix
    # ./fish.nix
    ./skhd.nix
  ];

  nixpkgs.config.allowUnfree = true;

  environment.variables.EDITOR = "hx";

  users.users.emil.shell = pkgs.nushell;
  # programs.fish.enable = true;
  # programs.nushell.enable = true;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nix.settings.trusted-users = ["Emil" "root"];

  services.nix-daemon.enable = true;
  system.stateVersion = 4;

  security.pam.enableSudoTouchIdAuth = true;

  users.users.emil = {
    name = "emil";
    home = "/Users/emil";
  };

  home-manager.users.emil = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      # ./darwin/darwin-application-activation.nix
      common
      (profiles + "/cli")
      (profiles + "/dev")
      (profiles + "/lang-servers")
    ];

    programs.home-manager.enable = true;

    programs.java.enable = true;
    programs.java.package = pkgs.temurin-bin-23;

    # disabledModules = ["targets/darwin/linkapps.nix"];

    home.stateVersion = "22.11";
    nixpkgs.config.allowUnfree = true;

    # programs.fish.enable = true;

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    programs.nushell.enable = true;
    programs.zoxide = {
      enable = true;
      options = ["--cmd s"];
      enableNushellIntegration = true;
    };

    home.file.".config/tridactyl/tridactylrc".source = ./tridactylrc;
  };

  fonts.packages = with pkgs; [
    intel-one-mono
    fira-code
    tamzen
    work-sans
    iosevka-bin
    overpass
    julia-mono
  ];
}
