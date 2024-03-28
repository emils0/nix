{
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";

    onActivation.upgrade = true;

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
    ];

    casks = [
      # "dotnet-sdk"

      # "emacs-app-nightly"
      "brave-browser"
      "firefox-developer-edition"
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
      "wezterm"
      "dotnet-sdk"
      "mongodb-compass"

      "android-platform-tools"
      "android-studio"
      "flutter"
    ];

    masApps = {Amphetamine = 937984704;};

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
