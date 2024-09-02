{pkgs, ...}: let
  env =
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
      $env.PATH = ($env.PATH | split row (char esep) | prepend ["~/.nix-profile/bin/" "/usr/local/bin" "/usr/bin"] | append ~/.dotnet/tools)

      $env.VISUAL = "/home/emil/.nix-profile/bin/hx"
      $env.EDITOR = "/home/emil/.nix-profile/bin/hx"
      $env.SUDO_EDITOR = "/home/emil/.nix-profile/bin/hx"
      $env.XDG_DATA_DIRS = "/nix/var/nix/profiles/default/share:/home/emil/.nix-profile/share:/usr/share/ubuntu:/usr/local/share:/usr/share:/var/lib/snapd/desktop:/nix/var/nix/profiles/default/share:/home/emil/.nix-profile/share:/usr/share/ubuntu:/usr/local/share:/usr/share:/var/lib/snapd/desktop"
    '';
in {
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    extraConfig = env;
  };

  programs.carapace.enable = true;
  programs.carapace.enableNushellIntegration = true;
}
