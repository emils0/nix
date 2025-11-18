# /hosts/work-wsl/default.nix
{
  self,
  nixpkgs,
  home-manager,
  helix,
  ...
}: let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  specialArgs = {
    inherit helix;
  };
in {
  homeConfigurations.work-wsl = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = specialArgs;
    modules = [
      ./home.nix
      # ../../common # No longer needed here, will be imported via _module.args
      {
        home = {
          username = "emil";
          homeDirectory = "/home/emil";
          stateVersion = "24.05";
        };
        targets.genericLinux.enable = true;
        programs.home-manager.enable = true;
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
