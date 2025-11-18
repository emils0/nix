{
  pkgs,
  lib,
  config,
  ...
}: let
  # Check if we're on NixOS (has config.system)
  isNixOS = config.targets.genericLinux.enable == false && !pkgs.stdenv.isDarwin;

  # Only add path hacks for Darwin and WSL
  pathHacks = lib.optionalString (!isNixOS) (
    if pkgs.stdenv.isDarwin
    then ''
      $env.PATH = ($env.PATH | split row (char esep) | prepend /run/current-system/sw/bin/ | prepend [/etc/profiles/per-user/emil/bin /nix/var/nix/profiles/default/bin /usr/local/opt/llvm/bin /usr/local/bin/] | append ~/.dotnet/tools)
      let nix_path = [
        "/Users/emil/.nix-defexpr/channels",
        "/nix/var/nix/profiles/per-user/root/channels"
      ]
      $env.NIX_PATH = ($nix_path | str join ":")
      $env.LIBRARY_PATH = "${pkgs.libiconv}/lib"
    ''
    else ''
      $env.PATH = ($env.PATH | split row (char esep) | prepend ["~/.nix-profile/bin/" "/usr/local/bin" "/usr/bin"] | append ~/.dotnet/tools)
      $env.SUDO_EDITOR = "/home/emil/.nix-profile/bin/hx"
      $env.XDG_DATA_DIRS = "/nix/var/nix/profiles/default/share:/home/emil/.nix-profile/share:/usr/share/ubuntu:/usr/local/share:/usr/share:/var/lib/snapd/desktop"
      $env.LIBRARY_PATH = "${pkgs.libiconv}/lib"
    ''
  );

  # Common editor config (works everywhere)
  editorConfig = ''
    $env.VISUAL = "hx"
    $env.EDITOR = "hx"
  '';
in {
  programs.nushell = {
    enable = true;
    configFile.source = ./config.nu;
    extraConfig = lib.concatStrings [
      editorConfig
      pathHacks
      (builtins.readFile ./env.nu)
    ];
  };

  programs.zoxide = {
    enable = true;
    options = ["--cmd s"];
    enableNushellIntegration = true;
  };

  home.packages = with pkgs; [
    nushellPlugins.highlight
    nushellPlugins.polars
    nushellPlugins.query
    nufmt
    fish
  ];

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };
}
