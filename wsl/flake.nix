{
  description = "A flake for Emil's home configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    helix.url = "github:helix-editor/helix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    helix,
    ...
  }: {
    homeConfigurations = {
      emil = home-manager.lib.homeManagerConfiguration {
        configuration = {pkgs, ...}: {
          home = {
            username = "emil";
            homeDirectory = "/home/emil";
            stateVersion = "22.11";
          };

          programs.home-manager.enable = true;

          programs.git.enable = true;
          programs.fish.enable = true;
          programs.bash.enable = true;
          targets.genericLinux.enable = true;

          imports = [
            ../common
            ./packages.nix
          ];

          programs.eza.enable = true;

          programs.zoxide = {
            enable = true;
            options = ["--cmd s"];
          };

          programs.direnv = {
            enable = true;
            nix-direnv.enable = true;
          };
        };

        nixpkgs = {
          inherit (nixpkgs) system;
        };
      };
    };
  };
}
