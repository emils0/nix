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
    ];

    casks = [
      "dotnet-sdk"

      # "emacs-app-nightly"
      "eloston-chromium"
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
    ];

    masApps = { Amphetamine = 937984704; };

    taps = [
      "homebrew/services"
      "homebrew/cask"
      "homebrew/cask-versions"
      # "jimeh/emacs-builds"
      "koekeishiya/formulae"
    ];
  };
}
