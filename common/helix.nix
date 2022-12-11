{
  imports = [
    ./languages.nix
    ./syntax.nix
  ];

  programs.helix = {
    enable = true;

    settings = {
      theme = "current";

      editor = {
        scrolloff = 9;
        idle-timeout = 50;
        completion-trigger-len = 1;
        gutters = ["diagnostics" "line-numbers"];
        true-color = true;
        color-modes = true;
        cursorline = true;
        line-number = "relative";

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

        lsp = {
          display-messages = true;
        };
      };
    };
  };
}
