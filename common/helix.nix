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
      ruff-lsp
      wsl-open
      csharp-ls
      dockerfile-language-server-nodejs
      dockfmt
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
    auto-save = true;
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

    statusline = {
      left = ["mode" "file-name"];
      center = ["diagnostics" "spinner"];
      right = ["position" "selections"];
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
  };
}
