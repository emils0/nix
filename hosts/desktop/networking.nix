{pkgs, ...}: {
  # Networking
  networking.hostName = "nixos";
  networking.nameservers = ["91.239.100.100" "89.233.43.71"];
  networking.interfaces.enp2s0.useDHCP = true;

  # Mullvad
  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;
}
