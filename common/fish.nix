{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza -G -s extension --icons";
      la = "eza -aG -s extension --icons";

      ll = "eza -lG -s extension --icons";
      lla = "eza -laG -s extension --icons";
      lt = "eza -GT -s extension --icons";
      lat = "eza -aGT -s extension --icons";

      ".." = "s ..";
      "..." = "s ../..";
      "...." = "s ../../..";
      "....." = "s ../../../..";
    };

    shellInit = ''
      fish_add_path ~/.emacs.d/bin
      fish_add_path ~/.dotnet/tools
      set -x EDITOR hx
      set -x VISUAL hx
      set -x SUDO_EDITOR hx
    '';

    functions = {
      fish_greeting = {
        description = "Greeting function that starts on shell init";
        body = "";
      };

      zr = "command zellij run - -name \"$argv\" -- fish -c \"$argv\"";
      zrf = "command zellij run --name \"$argv\" --floating -- fish -c \"$argv\"";
      ze = "command zellij edit $argv";
      zef = "command zellij edit --floating $argv";
    };
  };
}
