{pkgs, ...}: let
  theme = import ./themes/gruvbox/mix-dark-medium.nix;
in {
  programs.wezterm = {
    enable = true;
    # package = pkgs.runCommand "dummy-wezterm" {} "mkdir $out";

    extraConfig = builtins.readFile ./wezterm.lua;

    colorSchemes.current = {
      ansi = [
        theme.bg2
        theme.red
        theme.green
        theme.yellow
        theme.blue
        theme.purple
        theme.aqua
        theme.fg1
      ];
      brights = [
        theme.bg1
        theme.lightred
        theme.lightgreen
        theme.lightyellow
        theme.lightblue
        theme.lightpurple
        theme.lightaqua
        theme.fg0
      ];

      tab_bar = {
        # background = theme.bg1;

        active_tab = {
          bg_color = theme.bg0;
          fg_color = theme.fg0;

          intensity = "Bold";
          underline = "None";

          italic = false;
          strikethrough = false;
        };

        inactive_tab = {
          bg_color = theme.bg2;
          fg_color = theme.fg1;

          italic = false;
          strikethrough = false;
        };

        inactive_tab_hover = {
          bg_color = theme.bg3;
          fg_color = theme.fg1;

          italic = true;
          strikethrough = false;
        };

        new_tab = {
          bg_color = theme.bg0;
          fg_color = theme.fg0;
        };

        new_tab_hover = {
          bg_color = theme.bg0;
          fg_color = theme.fg0;

          intensity = "Bold";
        };
      };

      background = theme.bg;
      foreground = theme.fg;

      cursor_bg = theme.fg1;
      cursor_fg = theme.bg0;
      cursor_border = theme.fg1;
      compose_cursor = theme.fg0;

      selection_bg = theme.fg1;
      selection_fg = theme.bg0;
    };
  };
}
