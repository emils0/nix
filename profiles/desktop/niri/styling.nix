{...}: {
  programs.niri.settings = {
    # Layout styling
    layout = {
      gaps = 16;

      center-focused-column = "never";

      preset-column-widths = [
        {proportion = 0.33333;}
        {proportion = 0.5;}
        {proportion = 0.66667;}
      ];

      # Default width for new windows
      default-column-width = {proportion = 0.5;};

      focus-ring = {
        width = 2;
        active.color = "#ff69b4dd";
        inactive.color = "#50505080";
      };

      border = {
        width = 2;
        active.color = "#ff1493dd";
        inactive.color = "#50505080";
      };

      # Window shadows
      shadow = {
        enable = true;
        softness = 30.0;
        spread = 5.0;
        offset = {
          x = 0;
          y = 5;
        };
        color = "#0007";
      };
    };

    # Screenshot settings
    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

    # Window rules
    window-rules = [
      # Rounded corners for all windows
      {
        matches = [{}];
        geometry-corner-radius = {
          bottom-left = 8.0;
          bottom-right = 8.0;
          top-left = 8.0;
          top-right = 8.0;
        };
        clip-to-geometry = true;
      }

      # WezTerm initial configure workaround
      {
        matches = [{app-id = "^org\\.wezfurlong\\.wezterm$";}];
        default-column-width = {};
      }

      # Firefox picture-in-picture as floating
      {
        matches = [
          {
            app-id = "zen$";
            title = "^Picture-in-Picture$";
          }
        ];
        open-floating = true;
      }
    ];

    # Remove client-side decorations
    prefer-no-csd = true;
  };
}
