{
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";

    onActivation.upgrade = true;
    onActivation.autoUpdate = true;

    brews = [
      # "yabai"
      "aspell"
      # "gcc"
      # "libgccjit"
      # "pyqt"
      "coreutils"
      # "gdb"
      "texlab"
      # "pkg-config"
      # "poppler"
      "automake"
      "libtool"
      "cocoapods"
      "firebase-cli"

      # temporary
      # "rustfmt"
      "dart"
      "arduino-cli"
    ];

    casks = [
      # "dotnet-sdk"

      # "emacs-app-nightly"
      "tor-browser"
      "firefox@developer-edition"
      "zen-browser"
      "orion"
      "utm"
      "discord"
      "prismlauncher"
      "iina"
      "steam"
      "transmission"
      "element"
      "keepassxc"
      "microsoft-teams"
      # "wezterm"
      "dotnet-sdk"
      "mongodb-compass"

      "android-platform-tools"
      "android-studio"
      "flutter"
      "wezterm"
    ];

    masApps = {
      Amphetamine = 937984704;
      WireGuard = 1451685025;
    };

    taps = [
      "homebrew/services"
      # "homebrew/cask"
      "homebrew/cask-versions"
      # "jimeh/emacs-builds"
      "koekeishiya/formulae"
      "dart-lang/dart"
    ];
  };
}
