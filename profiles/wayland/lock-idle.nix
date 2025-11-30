{pkgs, ...}: let
  lock = "${pkgs.swaylock}/bin/swaylock -f";
  display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
in {
  programs.swaylock = {
    enable = true;
    settings = {
      color = "1e1e2e"; # Dark background

      ring-color = "313244";
      ring-clear-color = "89b4fa";
      ring-ver-color = "ff69b4"; # Pink when verifying
      ring-wrong-color = "f38ba8"; # Red when wrong

      inside-color = "1e1e2e";
      inside-clear-color = "1e1e2e";
      inside-ver-color = "1e1e2e";
      inside-wrong-color = "1e1e2e";

      key-hl-color = "ff69b4"; # Pink highlight
      bs-hl-color = "f38ba8"; # Red for backspace

      text-color = "cdd6f4";
      text-clear-color = "cdd6f4";
      text-ver-color = "cdd6f4";
      text-wrong-color = "f38ba8";

      line-color = "00000000"; # Transparent
      separator-color = "00000000";

      show-failed-attempts = true;
      indicator-radius = 100;
      indicator-thickness = 10;
    };
  };

  # Proper systemd-integrated swayidle service
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 600; # 10 minutes - lock session
        command = "loginctl lock-session";
      }
      {
        timeout = 610; # 10 seconds after lock - turn off monitors
        command = display "off";
        resumeCommand = display "on";
      }
      {
        timeout = 700; # 15 minutes - suspend
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
    events = [
      {
        event = "before-sleep";
        command = lock;
      }
      {
        event = "after-resume";
        command = display "on";
      }
      {
        event = "lock";
        command = lock;
      }
    ];
  };
}
