{pkgs, ...}: {
  # User
  users.users.emil = {
    isNormalUser = true;
    initialPassword = "Kode1234";
    extraGroups = ["wheel" "libvirt"];
    shell = pkgs.nushell;
  };
}
