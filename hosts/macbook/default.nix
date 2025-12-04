# /hosts/macbook/default.nix
{
  self,
  nixpkgs,
  darwin,
  home-manager,
  helix,
  ...
}: let
  system = "aarch64-darwin";
  specialArgs = {
    inherit helix;
  };
in {
  darwinConfigurations."Emils-MacBook-Pro" = darwin.lib.darwinSystem {
    inherit system specialArgs;
    modules = [
      ./configuration.nix
      home-manager.darwinModules.home-manager
      {
        nixpkgs.config.allowUnfree = true;
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = specialArgs;
          backupFileExtension = "backup";
        };
      }
      # Provide access to profiles and common modules
      {
        _module.args = {
          profiles = ../../profiles;
          common = ../../common;
        };
      }
    ];
  };
}
