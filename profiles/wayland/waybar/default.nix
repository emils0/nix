{...}: {
  programs.waybar = {
    enable = true;
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 10px;
        min-height: 0;
      }

      window#waybar {
        background: rgba(30, 30, 46, 0.9);
        color: #cdd6f4;
        border-radius: 16px;
      }

      #workspaces {
        margin: 8px 4px;
      }

      #workspaces button {
        padding: 6px 4px;
        color: #89b4fa;
        background: transparent;
        border: 1px solid transparent;
        border-radius: 6px;
        margin: 3px 0;
        min-width: 24px;
      }

      #workspaces button.active {
        color: #ff1493;
        border: 1px solid #ff1493;
        background: rgba(255, 20, 147, 0.15);
      }

      #workspaces button:hover {
        background: rgba(137, 180, 250, 0.1);
      }

      #clock {
        color: #ff69b4;
        font-weight: bold;
        font-size: 13px;
        padding: 8px 4px;
        margin: 8px 4px;
        background: rgba(255, 105, 180, 0.1);
        border-radius: 8px;
      }

      #pulseaudio,
      #custom-idle {
        padding: 6px 4px;
        margin: 3px 6px;
        color: #89b4fa;
        background: rgba(137, 180, 250, 0.1);
        border-radius: 8px;
        font-size: 11px;
        min-width: 36px;
      }

      #pulseaudio {
        color: #f9e2af;
        background: rgba(249, 226, 175, 0.1);
      }

      #custom-idle.enabled {
        color: #a6e3a1;
        background: rgba(166, 227, 161, 0.1);
      }

      #custom-idle.disabled {
        color: #f38ba8;
        background: rgba(243, 139, 168, 0.1);
      }
    '';
  };
}
