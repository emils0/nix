{
  nixpkgs,
  home-manager,
  helix,
  darwin,
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

  # Helper function for Darwin configurations
  mkDarwinConfig = {
    system ? "x86_64-darwin",
    extraModules ? [],
    overlays ? [], # Add this parameter
  }: let
    pkgs = import nixpkgs {
      inherit system;
      inherit overlays; # Use the passed overlays
    };
  in
    darwin.lib.darwinSystem {
      inherit system;
      inherit pkgs;
      specialArgs = {
        inherit helix;
      };
      modules =
        [
          home-manager.darwinModules.home-manager
          {
            # Basic system configuration
            nixpkgs.config.allowUnfree = true;
            environment.variables.EDITOR = "hx";
            users.users.emil = {
              name = "emil";
              home = "/Users/emil";
              shell = pkgs.nushell;
            };

            # Nix settings
            nix.extraOptions = ''
              experimental-features = nix-command flakes
            '';
            nix.settings.trusted-users = ["Emil" "root"];

            # System services and state
            # services.nix-daemon.enable = true;
            system.stateVersion = 4;

            # Security
            security.pam.services.sudo_local.touchIdAuth = true;

            # Fonts
            fonts.packages = with pkgs; [
              intel-one-mono
              fira-code
              tamzen
              work-sans
              iosevka-bin
              overpass
              julia-mono
            ];

            # Home Manager configuration
            home-manager.extraSpecialArgs = {
              inherit helix;
            };
            home-manager.backupFileExtension = "backup";
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.emil = {
              pkgs,
              lib,
              ...
            }: {
              home = {
                stateVersion = "22.11";
              };

              imports = [
                ../common
              ];

              nixpkgs.config.allowUnfree = true;

              programs = {
                home-manager.enable = true;
                java = {
                  enable = true;
                  package = pkgs.temurin-bin-23;
                };
                direnv = {
                  enable = true;
                  nix-direnv.enable = true;
                };
                nushell.enable = true;
                zoxide = {
                  enable = true;
                  options = ["--cmd s"];
                  enableNushellIntegration = true;
                };
              };

              home.file.".config/tridactyl/tridactylrc".source = ../tridactylrc;
            };
          }
        ]
        ++ extraModules;
    };
}
