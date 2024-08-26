{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    git-ignore
    comma
    cachix
    eza
    ripgrep
    wget
    aria
    unzip
    bottom
    yt-dlp
    curl
    ffmpeg
    git
    gnupg
    asciinema
    fd
    so
    gnuplot

    nodejs
    bun
    nil
    sqls
    rust-analyzer
    arduino-language-server
    omnisharp-roslyn
    jsonnet
    clang-tools
    delve
    rustfmt
    pandoc
    # terminal-typeracer
    kalker
    mongosh

    lua
    clang
    cargo
    cargo-criterion
    sea-orm-cli
    gradle
    gnumake
    cmake
    libtool
    kotlin
    kotlin-native
    rustc
    sqlx-cli
    go
    clippy
    cargo-edit
    cargo-watch
    openssl_3_0
    zld
    pyright

    python3Packages.pip
    nodePackages.npm
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.svelte-language-server
    nodePackages.prettier
    nodePackages.mermaid-cli
    nodePackages."@angular/cli"

    (
      let
        my-python-packages = python-packages:
          with python-packages; [
            isort
            black
          ];
        python-with-my-packages = python311.withPackages my-python-packages;
      in
        python-with-my-packages
    )
  ];
}
