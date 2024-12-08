{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    jujutsu
    git-ignore
    gitui
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
    helix-gpt
    typst
    difftastic
    tailspin
    devenv

    bun
    nil
    sqls
    rust-analyzer
    basedpyright
    poetry
    omnisharp-roslyn
    jsonnet
    clang-tools
    delve
    rustfmt
    pandoc
    # terminal-typeracer
    kalker

    clang
    cargo
    cargo-tauri
    cargo-criterion

    ouch
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
            uv
            debugpy
          ];
        python-with-my-packages = python312.withPackages my-python-packages;
      in
        python-with-my-packages
    )
  ];
}
