{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    git-ignore
    comma
    cachix
    aspell
    aspellDicts.en
    aspellDicts.da
    exa
    fzf
    ripgrep
    wget
    unzip
    killall
    bottom
    yt-dlp
    ffmpeg
    curl
    git
    gnupg
    asciinema
    fd
    so
    gitui
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
    zld

    nodePackages.npm
    nodePackages.degit
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.svelte-language-server
    nodePackages.prettier
    nodePackages.mermaid-cli
    nodePackages.vscode-langservers-extracted
    dotnetPackages.Nuget
    haskellPackages.brittany

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
