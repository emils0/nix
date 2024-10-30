{
  nixpkgs,
  home-manager,
  helix,
  ...
}: {
  mkHomeConfig = {
    system ? "x86_64-linux",
    username ? "emil",
    homeDirectory ? "/home/emil",
    extraModules ? [],
    extraSpecialArgs ? {},
  }: let
    pkgs = nixpkgs.legacyPackages.${system};
  in
    home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {
        inherit helix;
      };
      modules = [
        {
          home = {
            inherit username homeDirectory;
            stateVersion = "24.11";
          };
          targets.genericLinux.enable = true;
          programs = {
            home-manager.enable = true;
            bash.enable = true;
          };
          imports = [../common] ++ extraModules;
        }
      ];
    };

  # Helper function for NixOS configurations (uncomment when needed)
  # mkNixosConfig = { system ? "x86_64-linux", extraModules ? [] }:
  #   nixpkgs.lib.nixosSystem {
  #     inherit system;
  #     specialArgs = {
  #       inherit helix;
  #     };
  #     modules = [
  #       ../common/nixos.nix
  #       home-manager.nixosModules.home-manager
  #       {
  #         home-manager.useGlobalPkgs = true;
  #         home-manager.useUserPackages = true;
  #         home-manager.users.emil = import ../common;
  #       }
  #     ] ++ extraModules;
  #   };

  # Helper function for Darwin configurations (uncomment when needed)
  # mkDarwinConfig = { system ? "aarch64-darwin", extraModules ? [] }:
  #   darwin.lib.darwinSystem {
  #     inherit system;
  #     specialArgs = {
  #       inherit helix;
  #     };
  #     modules = [
  #       ../common/darwin.nix
  #       home-manager.darwinModules.home-manager
  #       {
  #         home-manager.useGlobalPkgs = true;
  #         home-manager.useUserPackages = true;
  #         home-manager.users.emil = import ../common;
  #       }
  #     ] ++ extraModules;
  #   };
}
