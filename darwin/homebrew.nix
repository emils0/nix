{
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";

    onActivation.upgrade = true;

    brews = [
      # "yabai"
      "aspell"
      "gcc"
      "libgccjit"
      "pyqt"
      "coreutils"
      "gdb"
      "texlab"
      "pkg-config"
      "poppler"
      "automake"
      "libtool"

      # temporary
      "rustfmt"
    ];

    casks = [
      # "dotnet-sdk"

      # "emacs-app-nightly"
      "brave-browser"
      "eloston-chromium"
      "librewolf"
      "orion"
      "utm"
      "discord"
      "prismlauncher"
      "iina"
      "steam"
      "transmission"
      "element"
      "mactex-no-gui"
      "metasploit"
      "insomnia"
      "keepassxc"
      "microsoft-teams"
      "wezterm"
      "dotnet-sdk"
    ];

    masApps = {Amphetamine = 937984704;};

    taps = [
      "homebrew/services"
      "homebrew/cask"
      "homebrew/cask-versions"
      # "jimeh/emacs-builds"
      "koekeishiya/formulae"
    ];
  };
}
