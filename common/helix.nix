{
  programs.helix = {
    enable = true;

    settings = {
      theme = "catppuccin_mocha";

      editor = {
        scrolloff = 9;
        idle-timeout = 50;
        completion-trigger-len = 1;
        gutters = [ "diagnostics" "line-numbers" ];
        true-color = true;
        color-modes = true;
        cursorline = true;
        line-number = "relative";

        statusline = {
          left = [ "mode" "file-name" ];
          center = [ "diagnostics" "spinner" ];
          right = [ "position" "selections" ];
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

    languages = [
      {
        name = "java";
        scope = "source.java";
        injection-regex = "java";
        file-types = [ "java" ];
        roots = [ "pom.xml" "build.gradle" ];
        indent = { tab-width = 4; unit = "    "; };
        language-server.command = "jdt-language-server";
      }

      {
        name = "python";
        formatter = {
          command = "black";
          args = [ "--quiet" "-" ];
        };
        auto-format = true;
      }

      {
        name = "html";
        formatter = {
          command = "prettier";
          args = [ "--parser" "html" ];
        };
      }

      {
        name = "json";
        formatter = {
          command = "prettier";
          args = [ "--parser" "json" ];
        };
      }

      {
        name = "css";
        formatter = {
          command = "prettier";
          args = [ "--parser" "css" ];
        };
        auto-format = true;
      }

      {
        name = "javascript";
        formatter = {
          command = "prettier";
          args = [ "--parser" "typescript" ];
        };
        auto-format = true;
      }

      {
        name = "typescript";
        formatter = {
          command = "prettier";
          args = [ "--parser" "typescript" ];
        };
        auto-format = true;
      }

      {
        name = "bash";
        indent = { tab-width = 4; unit = "    "; };
        formatter = {
          command = "shfmt";
          args = [ "-i" "4" ];
        };
        auto-format = true;
      }

      {
        name = "fish";
        formatter = { command = "fish_indent"; };
        auto-format = true;
      }
    ];
  };
}
