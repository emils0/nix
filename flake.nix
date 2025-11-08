{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix.url = "gitlab:emil-s/helix-fork";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    helix,
    darwin,
    ...
  }: let
    lib = import ./lib {inherit nixpkgs home-manager helix darwin;};

    loco-overlay = final: prev: {
      loco-cli = prev.rustPlatform.buildRustPackage rec {
        pname = "loco";
        version = "0.15.0";
        src = prev.fetchCrate {
          inherit pname version;
          hash = "sha256-sTPFDdiYmw+ODAcuBh4XXpSXVZbbYxfjr+WiTGit18E=";
        };
        useFetchCargoVendor = true;
        cargoHash = "sha256-EsNFdk7bLRzyfncDRxqS0CQGdtPFdRRSlpTTxbQ8csI=";

        checkFlags = ["--skip=cli_tests"];
        meta = {
          description = "Loco CLI is a powerful command-line tool designed to streamline the process of generating Loco websites";
          homepage = "https://loco.rs";
          changelog = "https://github.com/loco-rs/loco/blob/master/CHANGELOG.md";
          license = prev.lib.licenses.asl20;
          maintainers = with prev.lib.maintainers; [sebrut];
          mainProgram = "loco";
        };
      };
    };
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

    # Darwin Configurations
    darwinConfigurations.Emils-MacBook-Pro = lib.mkDarwinConfig {
      extraModules = [
        ./darwin/packages.nix
        ./darwin/homebrew.nix
        ./darwin/skhd.nix
      ];
      overlays = [loco-overlay];
    };
  };
}
