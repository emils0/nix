{
  lib,
  pkgs,
  ...
}: {
  programs.niri.settings = {
    xwayland-satellite = {
      enable = true;
      path = lib.getExe pkgs.xwayland-satellite-unstable;
    };

    cursor = {
      theme = "Yaru";
      size = 24;
    };

    # Auto-start programs
    spawn-at-startup = [
      {command = ["waybar"];}
      {command = ["blueman-applet"];} # Bluetooth tray icon
      {command = ["wl-clip-persist" "--clipboard" "both"];} # Keep clipboard alive
      {command = ["wl-paste" "--watch" "cliphist" "store"];} # Store clipboard history
    ];

    # Don't show hotkey overlay at startup
    hotkey-overlay.skip-at-startup = true;

    outputs."HDMI-A-1" = {
      mode = {
        width = 3840;
        height = 2160;
        refresh = 29.981;
      };
      position = {
        x = 0;
        y = 0;
      };
    };

    outputs."DP-2" = {
      mode = {
        width = 2560;
        height = 1440;
        refresh = 165.0;
      };
      position = {
        x = 3840; # Position to the right of the 4K monitor
        y = 0;
      };
      variable-refresh-rate = true; # Enable VRR/G-Sync/FreeSync
    };

    # Input configuration
    input = {
      keyboard.xkb.layout = "us";

      mouse = {
        accel-profile = "flat";
        accel-speed = 0.0;
      };

      focus-follows-mouse.enable = true;
    };
  };
}
