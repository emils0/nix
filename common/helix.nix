{pkgs, ...}: {
  imports = [
    ./languages.nix
    ./themes/gruvbox
  ];

  programs.helix = {
    enable = true;

    extraPackages = with pkgs; [
      marksman
      ltex-ls
      taplo
      wsl-open
      csharp-ls
      dockerfile-language-server-nodejs
      dockfmt
      vscode-langservers-extracted
      lldb
      yaml-language-server
      tinymist
    ];
  };

  programs.helix.settings = {
    theme = "gruvbox_custom";

    keys.normal = {
      C-r = ":reset-diff-change";
      g.x = ":pipe-to xargs wsl-open";
      Z.Z = ":wq";
    };
  };

  programs.helix.settings.editor = {
    shell = ["nu" "--stdin" "-c"];
    bufferline = "multiple";
    scrolloff = 9;
    idle-timeout = 50;
    completion-trigger-len = 1;
    gutters = ["diff" "diagnostics" "line-numbers"];
    true-color = true;
    color-modes = true;
    cursorline = true;
    cursorcolumn = true;
    line-number = "absolute";
    popup-border = "none";

    statusline = {
      left = ["mode" "file-name" "read-only-indicator" "file-modification-indicator"];
      center = ["register" "diagnostics" "spinner"];
      right = ["version-control" "position" "selections"];

      mode = {
        normal = "NORMAL";
        insert = "INSERT";
        select = "SELECT";
      };
    };

    cursor-shape = {
      normal = "block";
      insert = "bar";
      select = "underline";
    };

    auto-pairs = {
      "<" = ">";
    };

    indent-guides = {
      render = true;
      skip-levels = 1;
    };

    soft-wrap.enable = true;

    lsp = {
      display-messages = true;
      display-inlay-hints = true;
    };

    jump-label-alphabet = "ntesiroahdmgywuflpkv";
  };
}
