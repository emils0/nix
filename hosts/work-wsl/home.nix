{
  pkgs,
  helix,
  profiles,
  ...
}: {
  imports = [
    (profiles + "/cli")
    (profiles + "/dev")
    (profiles + "/lang-servers")
  ];

  programs = {
    bash.enable = true;

    nushell.extraConfig = ''
      # WSL-specific PATH fixes
      $env.PATH = ($env.PATH | split row (char esep) | prepend ["~/.nix-profile/bin/" "/usr/local/bin" "/usr/bin"] | append ~/.dotnet/tools)
      $env.SUDO_EDITOR = "hx"
      $env.XDG_DATA_DIRS = "/nix/var/nix/profiles/default/share:/home/emil/.nix-profile/share:/usr/share/ubuntu:/usr/local/share:/usr/share:/var/lib/snapd/desktop"
    '';

    zoxide = {
      enable = true;
      options = ["--cmd s"];
      enableNushellIntegration = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  home.sessionVariables = {
    LIBRARY_PATH = "${pkgs.libiconv}/lib";
  };
}
