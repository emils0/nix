{pkgs, ...}: let
  path =
    if pkgs.stdenv.isDarwin
    then ''
      $env.PATH = ($env.PATH | split row (char esep) | prepend /run/current-system/sw/bin/ | prepend /etc/profiles/per-user/emil/bin | append ~/.dotnet/tools)
      let nix_path = [
        "/Users/emil/.nix-defexpr/channels",
        "darwin-config=/Users/emil/.nixpkgs/darwin-configuration.nix",
        "/nix/var/nix/profiles/per-user/root/channels"
      ]
      $env.NIX_PATH = ($nix_path | str join ":")
    ''
    else ''
      $env.PATH = ($env.PATH | split row (char esep) | prepend ~/.nix-profile/bin/ | append ~/.dotnet/tools)

      $env.VISUAL = "/home/emil/.nix-profile/bin/hx"
      $env.EDITOR = "/home/emil/.nix-profile/bin/hx"
      $env.SUDO_EDITOR = "/home/emil/.nix-profile/bin/hx"
    '';
in {
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    extraConfig = path;
  };

  programs.carapace.enable = true;
  programs.carapace.enableNushellIntegration = true;
}
