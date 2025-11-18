# /hosts/desktop/default.nix
{
  self,
  nixpkgs,
  home-manager,
  helix,
  zen-browser,
  nix-gaming,
  ...
}: let
  system = "x86_64-linux";
  specialArgs = {
    inherit helix zen-browser nix-gaming;
  };
in {
  nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./configuration.nix
      home-manager.nixosModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = specialArgs;
        };
      }
    ];
  };
}