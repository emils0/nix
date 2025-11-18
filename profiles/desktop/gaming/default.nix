{
  pkgs,
  nix-gaming,
  ...
}: {
  imports = [nix-gaming.nixosModules.pipewireLowLatency];

  programs.steam = {
    enable = true;

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
