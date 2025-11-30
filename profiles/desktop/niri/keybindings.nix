{pkgs, ...}: {
  programs.niri.settings.binds = {
    # Terminal
    "Mod+Return".action.spawn = ["wezterm"];

    # Close window
    "Mod+Q".action.close-window = {};

    # App launcher
    "Mod+Space".action.spawn = ["fuzzel"];

    # Clipboard history
    "Mod+V".action.spawn = [
      "bash"
      "-c"
      "cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
    ];

    # Tab management
    "Mod+W".action.toggle-column-tabbed-display = {};
    "Mod+Comma".action.consume-window-into-column = {};
    "Mod+Period".action.expel-window-from-column = {};

    # Window resize (cycle preset widths)
    "Mod+R".action.switch-preset-column-width = {};

    # Screenshot region (with annotation)
    "Super+Ctrl+S".action.spawn = [
      "bash"
      "-c"
      "grim -g \"$(slurp)\" - | swappy -f -"
    ];

    # Screenshot full screen
    "Print".action.spawn = [
      "bash"
      "-c"
      "grim - | swappy -f -"
    ];

    # Screenshot active window
    "Mod+Print".action.spawn = [
      "bash"
      "-c"
      "grim - | swappy -f -"
    ];

    # Lock screen
    "Super+Alt+L".action.spawn = ["loginctl" "lock-session"];

    # Lock and suspend immediately
    "Super+Alt+S".action.spawn = ["systemctl" "suspend"];

    # Overview
    "Mod+Tab".action.toggle-overview = {};

    # Navigate workspaces (vim-style)
    "Super+U".action.focus-workspace-up = {};
    "Super+D".action.focus-workspace-down = {};

    # Move window between workspaces
    "Super+Ctrl+U".action.move-window-to-workspace-up = {};
    "Super+Ctrl+D".action.move-window-to-workspace-down = {};

    # Window focus (vim bindings)
    "Super+H".action.focus-column-left = {};
    "Super+J".action.focus-window-down = {};
    "Super+K".action.focus-window-up = {};
    "Super+L".action.focus-column-right = {};

    # Jump to top/bottom window in column (vim-style: gg/G)
    "Mod+Shift+K".action.focus-window-top = {};
    "Mod+Shift+J".action.focus-window-bottom = {};

    # Cycling navigation (wraps around at edges)
    "Super+Alt+J".action.focus-window-down-or-top = {};
    "Super+Alt+K".action.focus-window-up-or-bottom = {};

    # Move window (vim bindings with Shift)
    "Super+Ctrl+H".action.move-column-left = {};
    "Super+Ctrl+J".action.move-window-down = {};
    "Super+Ctrl+K".action.move-window-up = {};
    "Super+Ctrl+L".action.move-column-right = {};

    # Focus and move between monitors
    "Super+Shift+H".action.focus-monitor-left = {};
    "Super+Shift+L".action.focus-monitor-right = {};
    "Super+Shift+Ctrl+H".action.move-column-to-monitor-left = {};
    "Super+Shift+Ctrl+L".action.move-column-to-monitor-right = {};

    # Maximize window (fills screen but respects bar)
    "Mod+F".action.maximize-column = {};

    # True fullscreen (covers everything including bar)
    "Mod+Ctrl+F".action.fullscreen-window = {};

    # Audio controls
    "XF86AudioRaiseVolume".action.spawn = ["pamixer" "-i" "5"];
    "XF86AudioLowerVolume".action.spawn = ["pamixer" "-d" "5"];
    "XF86AudioMute".action.spawn = ["pamixer" "-t"];

    # Media controls
    "XF86AudioPlay".action.spawn = ["playerctl" "play-pause"];
    "XF86AudioNext".action.spawn = ["playerctl" "next"];
    "XF86AudioPrev".action.spawn = ["playerctl" "previous"];

    # Screen recording toggle
    "Mod+Shift+R".action.spawn = [
      "bash"
      "-c"
      "pkill -SIGINT wl-screenrec || wl-screenrec -f ~/Videos/$(date +%Y-%m-%d_%H-%M-%S).mp4"
    ];

    # Color picker (Shift to avoid accidents)
    "Mod+Shift+C".action.spawn = [
      "bash"
      "-c"
      "hyprpicker -a"
    ];
  };
}
