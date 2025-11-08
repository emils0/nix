{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    comma
    cachix
    aspell
    aspellDicts.en
    aspellDicts.da
    exa
    bat
    ripgrep
    wget
    unzip
    killall
    tetex
    dash
    helix
    bottom
    time
    neofetch
    afetch
    yt-dlp
    ffmpeg
    wally-cli
    w3m
    curl
    git
    gnupg
    imv
    asciinema
    prismlauncher

    celluloid
    element-desktop
    insomnia
    keepassxc
    grapejuice
    dino
    blanket
    tor-browser-bundle-bin
    thunderbird
    transmission-gtk
    libreoffice-fresh
    librewolf
    thunderbird

    spotify
    discord-canary
    steam
    steam-run-native
    lutris
    jetbrains.rider
    jetbrains.idea-ultimate

    gnome.gnome-boxes
    gnome.gnome-tweaks

    yaru-theme
    yaru-remix-theme
    orchis-theme

    omnisharp-roslyn
    postgresql
    nodejs
    rnix-lsp
    sqls
    rust-analyzer
    jdt-language-server
    jsonnet
    kotlin-language-server
    ktlint
    gopls
    google-java-format
    clang-tools
    delve
    rustfmt
    black
    nixfmt
    pandoc
    plantuml
    httpie
    exercism

    jdk
    lua
    cargo
    gradle
    gnumake
    cmake
    libtool
    kotlin
    kotlin-native
    rustc
    go
    clippy
    cargo-edit
    cargo-watch
    openssl_3_0

    nodePackages.npm
    nodePackages.degit
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.svelte-language-server
    nodePackages.intelephense
    nodePackages.prettier
    nodePackages.mermaid-cli
    nodePackages.vscode-langservers-extracted
    dotnetPackages.Nuget

    (
      let
        my-python-packages = python-packages:
          with python-packages; [
            jedi
            python-lsp-server
            pylint
            flake8
            rope
            isort
            mypy
          ];
        python-with-my-packages = python3.withPackages my-python-packages;
      in
        python-with-my-packages
    )
  ];
}
