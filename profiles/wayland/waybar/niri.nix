{pkgs, ...}: {
  imports = [./default.nix];

  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "left";
      output = "DP-2";
      width = 48;
      height = 400;
      margin-top = 10;
      margin-bottom = 10;
      margin-left = 8;

      modules-left = ["clock" "custom/idle"];
      modules-center = ["niri/workspaces"];
      modules-right = ["pulseaudio"];

      "niri/workspaces" = {
        format = "{index}";
      };

      clock = {
        format = "{:%H\n%M}";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      };

      pulseaudio = {
        format = "{icon}\n{volume}";
        format-muted = "󰖁";
        format-icons = {
          default = ["󰕿" "󰖀" "󰕾"];
        };
        on-click = "pamixer -t";
        tooltip-format = "{volume}%";
      };

      "custom/idle" = {
        exec = pkgs.writeShellScript "waybar-idle" ''
          if systemctl --user is-active swayidle.service > /dev/null 2>&1; then
            echo '{"text": "󰥔", "class": "enabled", "tooltip": "Idle suspend enabled"}'
          else
            echo '{"text": "󱫢", "class": "disabled", "tooltip": "Idle suspend disabled"}'
          fi
        '';
        return-type = "json";
        interval = 5;
        signal = 8;
        on-click = "systemctl --user is-active swayidle.service > /dev/null 2>&1 && systemctl --user stop swayidle.service || systemctl --user start swayidle.service; pkill -RTMIN+8 waybar";
      };
    };
  };
}
