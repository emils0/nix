{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "exa -G -s extension";
      la = "exa -aG -s extension";

      ll = "exa -lG -s extension";
      lla = "exa -laG -s extension";
      lt = "exa -GT -s extension";
      lat = "exa -aGT -s extension";

      ".." = "s ..";
      "..." = "s ../..";
      "...." = "s ../../..";
      "....." = "s ../../../..";
    };

    shellInit = ''
      fish_add_path /Users/emil/.emacs.d/bin
      fish_add_path /Users/emil/.dotnet/tools
      set EDITOR helix
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

