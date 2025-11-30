{...}: {
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 0.0; # Not used with manual times
    longitude = 0.0;
    temperature = {
      day = 6500; # Normal daylight color temperature
      night = 3500; # Warmer evening color temperature
    };
    settings = {
      general = {
        adjustment-method = "wayland";
        fade = 1; # Transition gradually over 1 hour
      };
    };
    tray = false;
    dawnTime = "02:00";
    duskTime = "18:00";
  };
}
