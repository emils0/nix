{pkgs, ...}: {
  home-manager.users.emil.nixpkgs.config.allowUnfree = true;

  home-manager.users.emil.home.packages = with pkgs; [
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
    devenv

    nodejs
    bun
    nil
    sqls
    rust-analyzer
    jdt-language-server
    arduino-language-server
    omnisharp-roslyn
    jsonnet
    # clang
    # clang-tools
    # llvm
    delve
    rustfmt
    pandoc
    # terminal-typeracer
    kalker
    mongosh
    tailwindcss-language-server
    loco-cli

    lua
    cargo
    cargo-criterion
    sea-orm-cli
    gradle
    gnumake
    cmake
    libtool
    rustc
    sqlx-cli
    go
    clippy
    openssl_3_0
    zld
    pyright
    libiconv
    cargo-watch
    tio

    # claude-code

    python3Packages.pip
    nodePackages.npm
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.svelte-language-server
    nodePackages.prettier
    nodePackages.mermaid-cli
    # nodePackages."@angular/cli"

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
