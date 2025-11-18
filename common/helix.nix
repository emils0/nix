{
  pkgs,
  helix,
  ...
}: {
  imports = [
    ./languages.nix
    ./themes/gruvbox
  ];

  programs.helix = {
    enable = true;
    package = helix.packages.${pkgs.system}.default;

    extraPackages = with pkgs; [
      marksman
      ltex-ls
      taplo
      wsl-open
      csharp-ls
      dockerfile-language-server
      dockfmt
      vscode-langservers-extracted
      lldb
      yaml-language-server
      tinymist
      emmet-ls
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
    shell = ["zsh"];

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
    popup-border = "menu";

    # rainbow-brackets = true;

    end-of-line-diagnostics = "hint";
    inline-diagnostics.cursor-line = "warning";

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

    # persistence = {
    #   old-files = true;
    #   commands = true;
    #   search = true;
    #   clipboard = true;
    # };

    cursor-shape = {
      normal = "block";
      insert = "bar";
      select = "underline";
    };

    indent-guides = {
      render = true;
      skip-levels = 1;
    };

    # sticky-context.enable = true;

    soft-wrap.enable = true;

    rounded-corners = true;

    lsp = {
      display-messages = true;
      display-inlay-hints = true;
    };

    jump-label-alphabet = "ntesiroahdmgywuflpkv";
  };
}
