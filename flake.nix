{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    helix.url = "gitlab:emil-s/helix-fork";

    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-gaming.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, ...} @ inputs: let
    lib = inputs.nixpkgs.lib;

    # Get a list of all directories in ./hosts
    hostNames = lib.attrNames (builtins.readDir ./hosts);

    # Import all hosts found in the ./hosts directory
    importedHosts = map (hostName: import (./hosts + "/${hostName}") inputs) hostNames;

    # Merge the outputs of all imported hosts
    allOutputs = lib.foldl' lib.recursiveUpdate {} importedHosts;
  in
    allOutputs;
}
