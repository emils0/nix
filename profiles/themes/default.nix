{pkgs, ...}: {
  home.packages = with pkgs; [
    yaru-theme
    yaru-remix-theme
    orchis-theme
    papirus-icon-theme
  ];

  # GTK configuration
  gtk = {
    enable = true;

    theme = {
      name = "Orchis-Dark";
      package = pkgs.orchis-theme;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Yaru";
      package = pkgs.yaru-theme;
      size = 24;
    };

    font = {
      name = "Inter";
      size = 11;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk3.extraCss = ''
      selection {
        background-color: #ff69b4;
        color: #ffffff;
      }
    '';

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraCss = ''
      selection {
        background-color: #ff69b4;
        color: #ffffff;
      }
    '';
  };

  # Ensure dark mode preference is set via dconf (for GNOME apps)
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Orchis-Dark";
      icon-theme = "Papirus-Dark";
      cursor-theme = "Yaru";
    };
  };

  # Set environment variables for consistency
  home.sessionVariables = {
    GTK_THEME = "Orchis-Dark";
  };
}
