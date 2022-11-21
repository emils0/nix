{ pkgs, ... }:
{
  services.skhd = {
    enable = true;
    package = pkgs.skhd;

    skhdConfig = ''
      # alt - n : yabai -m window --focus west
      # alt - e : yabai -m window --focus south
      # alt - i : yabai -m window --focus north
      # alt - o : yabai -m window --focus east

      alt + shift - n : yabai -m window --swap west
      alt + shift - e : yabai -m window --swap south
      alt + shift - i : yabai -m window --swap north
      alt + shift - o : yabai -m window --swap east

      cmd + shift - e : emacsclient -c
      cmd + shift - n : yabai -m space --rotate 90

      alt + shift - 1 : yabai -m window --space 1
      alt + shift - 2 : yabai -m window --space 2
      alt + shift - 3 : yabai -m window --space 3
      alt + shift - 4 : yabai -m window --space 4
    '';
  };
}
