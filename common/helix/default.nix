let
  theme = import ./gruvbox/mix-light-medium.nix;
in {
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

    languages = [
      {
        name = "java";
        scope = "source.java";
        injection-regex = "java";
        file-types = ["java"];
        roots = ["pom.xml" "build.gradle"];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
        language-server.command = "jdt-language-server";
      }

      {
        name = "python";
        formatter = {
          command = "black";
          args = ["--quiet" "-"];
        };
        auto-format = true;
      }

      {
        name = "html";
        formatter = {
          command = "prettier";
          args = ["--parser" "html"];
        };
      }

      {
        name = "json";
        formatter = {
          command = "prettier";
          args = ["--parser" "json"];
        };
      }

      {
        name = "css";
        formatter = {
          command = "prettier";
          args = ["--parser" "css"];
        };
        auto-format = true;
      }

      {
        name = "javascript";
        formatter = {
          command = "prettier";
          args = ["--parser" "typescript"];
        };
        auto-format = true;
      }

      {
        name = "typescript";
        formatter = {
          command = "prettier";
          args = ["--parser" "typescript"];
        };
        auto-format = true;
      }

      {
        name = "markdown";
        formatter = {
          command = "prettier";
          args = ["--parser" "markdown"];
        };
        auto-format = true;
      }

      {
        name = "bash";
        indent = {
          tab-width = 4;
          unit = "    ";
        };
        formatter = {
          command = "shfmt";
          args = ["-i" "4"];
        };
        auto-format = true;
      }

      {
        name = "fish";
        formatter = {command = "fish_indent";};
        auto-format = true;
      }

      {
        name = "c-sharp";
        auto-format = true;
      }

      {
        name = "nix";
        formatter = {
          command = "alejandra";
          args = ["--quiet"];
        };
        auto-format = true;
      }
    ];

    themes = {
      current = let
        color = theme;
      in {
        "type" = theme.blue;
        "constant" = theme.purple;
        "constant.builtin" = theme.purple;
        "constant.character.escape" = theme.yellow;
        "constant.numeric" = theme.purple;
        "string" = theme.green;
        "string.regexp" = theme.blue;
        "comment" = theme.gray0;
        "variable" = theme.fg0;
        "variable.builtin" = theme.purple;
        "variable.parameter" = theme.fg0;
        "variable.other.member" = theme.yellow;
        "label" = theme.aqua;
        "punctuation" = theme.gray2;
        "punctuation.delimiter" = theme.gray2;
        "punctuation.bracket" = theme.gray2;
        "punctuation.special" = theme.yellow;
        "keyword" = theme.red;
        "keyword.directive" = theme.aqua;
        "keyword.storage.modifier" = theme.orange;
        "operator" = theme.orange;
        "function" = theme.green;
        "function.method" = theme.aqua;
        "function.builtin" = theme.green;
        "function.macro" = theme.green;
        "tag" = theme.yellow;
        "namespace" = theme.aqua;
        "attribute" = theme.blue;
        "constructor" = theme.yellow;
        "module" = theme.blue;
        "special" = theme.orange;

        "markup.heading.marker" = theme.gray2;
        "markup.heading.1" = {
          fg = theme.red;
          modifiers = ["bold"];
        };
        "markup.heading.2" = {
          fg = theme.orange;
          modifiers = ["bold"];
        };
        "markup.heading.3" = {
          fg = theme.yellow;
          modifiers = ["bold"];
        };
        "markup.heading.4" = {
          fg = theme.green;
          modifiers = ["bold"];
        };
        "markup.heading.5" = {
          fg = theme.blue;
          modifiers = ["bold"];
        };
        "markup.heading.6" = {
          fg = theme.fg0;
          modifiers = ["bold"];
        };
        "markup.list" = theme.red;
        "markup.bold" = {modifiers = ["bold"];};
        "markup.italic" = {modifiers = ["italic"];};
        "markup.link.url" = {
          fg = theme.blue;
          modifiers = ["underlined"];
        };
        "markup.link.text" = theme.purple;
        "markup.quote" = theme.gray2;
        "markup.raw" = theme.green;

        "diff.plus" = theme.green;
        "diff.delta" = theme.orange;
        "diff.minus" = theme.red;

        "ui.background" = {bg = theme.bg;};
        "ui.background.separator" = theme.gray0;
        "ui.cursor" = {
          fg = theme.bg0;
          bg = theme.fg1;
        };
        "ui.cursor.primary" = {
          fg = theme.bg0;
          bg = theme.fg0;
        };
        "ui.cursor.match" = {
          fg = theme.orange;
          bg = theme.bg_visual_yellow;
        };
        "ui.cursor.insert" = {
          fg = theme.bg0;
          bg = theme.gray2;
        };
        "ui.cursor.select" = {
          fg = theme.bg0;
          bg = theme.blue;
        };
        "ui.cursorline.primary" = {bg = theme.bg4;};
        "ui.cursorline.secondary" = {bg = theme.bg;};
        "ui.selection" = {bg = theme.bg3;};
        "ui.linenr" = theme.gray0;
        "ui.linenr.selected" = theme.fg0;
        "ui.statusline" = {
          fg = theme.fg0;
          bg = theme.bg3;
        };
        "ui.statusline.inactive" = {
          fg = theme.gray0;
          bg = theme.bg2;
        };
        "ui.statusline.normal" = {
          fg = theme.bg0;
          bg = theme.fg0;
          modifiers = ["bold"];
        };
        "ui.statusline.insert" = {
          fg = theme.bg0;
          bg = theme.yellow;
          modifiers = ["bold"];
        };
        "ui.statusline.select" = {
          fg = theme.bg0;
          bg = theme.blue;
          modifiers = ["bold"];
        };
        "ui.bufferline" = {
          fg = theme.gray0;
          bg = theme.bg1;
        };
        "ui.bufferline.active" = {
          fg = theme.fg0;
          bg = theme.bg3;
          modifiers = ["bold"];
        };
        "ui.popup" = {
          fg = theme.gray2;
          bg = theme.bg2;
        };
        "ui.window" = {
          fg = theme.gray0;
          bg = theme.bg2;
        };
        "ui.help" = {
          fg = theme.fg0;
          bg = theme.bg2;
        };
        "ui.text" = theme.fg0;
        "ui.text.focus" = theme.fg0;
        "ui.menu" = {
          fg = theme.fg0;
          bg = theme.bg3;
        };
        "ui.menu.selected" = {
          fg = theme.bg0;
          bg = theme.blue;
          modifiers = ["bold"];
        };
        "ui.virtual.whitespace" = {fg = theme.bg4;};
        "ui.virtual.indent-guide" = {fg = theme.bg4;};
        "ui.virtual.ruler" = {bg = theme.bg3;};

        "hint" = theme.blue;
        "info" = theme.aqua;
        "warning" = theme.yellow;
        "error" = theme.red;
        "diagnostic" = {modifiers = ["underlined"];};
      };
    };
  };
}
