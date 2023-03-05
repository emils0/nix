{
  imports = [
    ./languages.nix
    ./themes/gruvbox
  ];

  programs.helix = {
    enable = true;
    package = helix-master.packages."x86_64-darwin".default;

    settings = {
      theme = "current";

      editor = {
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
        };

        lsp.display-messages = true;
      };
    };
  };
}
