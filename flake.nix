{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix.url = "github:helix-editor/helix/bump-flake";
  };

  outputs = {
    nixpkgs,
    home-manager,
    helix,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations."emil" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = {
        helix-flake = helix;
      };

      modules = [
        {
          home = {
            username = "emil";
            homeDirectory = "/home/emil";
            stateVersion = "22.11";
          };
          programs.home-manager.enable = true;
          programs.git.enable = true;
          programs.bash.enable = true;
          targets.genericLinux.enable = true;
          programs.zoxide = {
            enable = true;
            options = ["--cmd s"];
            enableNushellIntegration = true;
          };

          imports = [
            ./common
            ./wsl/packages.nix
          ];
        }
      ];
    };
  };
}
