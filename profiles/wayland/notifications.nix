{...}: {
  services.mako = {
    enable = true;

    settings = {
      # Appearance matching your pink/dark theme
      background-color = "#1e1e2edd";
      text-color = "#cdd6f4";
      border-olor = "#ff69b4";
      border-size = 2;
      border-radius = 8;

      # Behavior
      default-timeout = 5000; # 5 seconds
      group-by = "app-name"; # Group notifications by application

      # Layout
      width = 350;
      height = 150;
      margin = "20";
      padding = "15";

      # Icons
      icons = true;
      max-icon-size = 48;

      # Font
      font = "sans-serif 11";

      # Additional settings
      layer = "overlay"; # Show above all windows
      anchor = "top-right"; # Position on screen
    };
  };
}
