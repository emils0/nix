{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "exa -G -s extension --icons";
      la = "exa -aG -s extension --icons";

      ll = "exa -lG -s extension --icons";
      lla = "exa -laG -s extension --icons";
      lt = "exa -GT -s extension --icons";
      lat = "exa -aGT -s extension --icons";

      ".." = "s ..";
      "..." = "s ../..";
      "...." = "s ../../..";
      "....." = "s ../../../..";
    };

    shellInit = ''
      fish_add_path ~/.emacs.d/bin
      fish_add_path ~/.dotnet/tools
      set EDITOR hx
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
