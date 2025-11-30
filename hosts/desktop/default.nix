{
  nixpkgs,
  home-manager,
  helix,
  zen-browser,
  nix-gaming,
  niri,
  ...
}: let
  system = "x86_64-linux";
  specialArgs = {
    inherit helix zen-browser nix-gaming niri;
  };
in {
  nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
    inherit system specialArgs;
    modules = [
      ./configuration.nix
      home-manager.nixosModules.home-manager
      {
        nixpkgs.overlays = [niri.overlays.niri];
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = specialArgs;
          sharedModules = [
            niri.homeModules.niri
          ];
        };
      }
    ];
  };
}
