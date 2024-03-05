{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    git-ignore
    comma
    cachix
    ripgrep
    wget
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
    dotnet-sdk
    gnuplot
    podman
    slirp4netns
    su

    ruff
    bun
    nil
    sqls
    rust-analyzer
    omnisharp-roslyn
    jsonnet
    clang-tools
    delve
    rustfmt
    nixfmt
    pandoc
    terminal-typeracer
    kalker

    clang
    cargo
    cargo-tauri
    cargo-criterion

    zstd
    pkg-config
    gradle
    gnumake
    cmake
    libtool
    rustc
    go
    clippy
    cargo-edit
    cargo-watch
    # pylyzer

    python3Packages.pip
    nodePackages.npm
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.svelte-language-server
    nodePackages.prettier
    nodePackages.mermaid-cli
    nodePackages.pyright
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
