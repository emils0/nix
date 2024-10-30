{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix.url = "gitlab:emil-s/helix-fork";

    # Uncomment when adding macOS configurations
    # darwin = {
    #   url = "github:lnl7/nix-darwin";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    helix,
    ...
  }: let
    lib = import ./lib {inherit nixpkgs home-manager helix;};
  in {
    homeConfigurations.work-wsl = lib.mkHomeConfig {
      extraModules = [
        ./wsl/packages.nix
        {
          programs.zoxide = {
            enable = true;
            options = ["--cmd s"];
            enableNushellIntegration = true;
          };
        }
      ];
    };

    # NixOS Configurations (uncomment when needed)
    # nixosConfigurations = {
    #   "my-nixos" = lib.mkNixosConfig {
    #     extraModules = [
    #       ./hosts/my-nixos/configuration.nix
    #     ];
    #   };
    # };

    # Darwin Configurations (uncomment when needed)
    # darwinConfigurations = {
    #   "my-mac" = lib.mkDarwinConfig {
    #     extraModules = [
    #       ./hosts/my-mac/configuration.nix
    #     ];
    #   };
    # };
  };
}
