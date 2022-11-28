{
  programs.helix = {
    enable = true;

    settings = {
      theme = "gruvbox_mix_dark_medium";

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
      gruvbox_mix_dark_medium = let
        bg_diff_green = "#34381b";
        bg_visual_green = "#3b4439";
        bg_diff_red = "#402120";
        bg_visual_red = "#4c3432";
        bg_diff_blue = "#0e363e";
        bg_visual_blue = "#374141";
        bg_visual_yellow = "#4f422e";
        bg_current_word = "#3c3836";

        bg0 = "#101010";
        bg1 = "#1c1c1c";
        bg = "#292828";
        bg2 = "#32302f";
        bg3 = "#383432";
        bg4 = "#3c3836";
        bg5 = "#45403d";
        bg6 = "#504945";
        bg7 = "#5a524c";
        bg8 = "#665c54";
        bg9 = "#7c6f64";
        gray0 = "#7c6f64";
        gray1 = "#928374";
        gray2 = "#a89984";

        fg0 = "#ddc7a1";
        fg = "#d4be98";
        fg1 = "#c5b18d";

        red = "#ea6962";
        orange = "#e78a4e";
        yellow = "#d8a657";
        green = "#a9b665";
        aqua = "#89b482";
        blue = "#7daea3";
        purple = "#d3869b";

        dimRed = "#b85651";
        dimOrange = "#bd6f3e";
        dimYellow = "#c18f41";
        dimGreen = "#8f9a52";
        dimAqua = "#72966c";
        dimBlue = "#68948a";
        dimPurple = "#ab6c7d";
      in {
        "type" = blue;
        "constant" = purple;
        "constant.builtin" = purple;
        "constant.character.escape" = yellow;
        "constant.numeric" = purple;
        "string" = green;
        "string.regexp" = blue;
        "comment" = gray0;
        "variable" = fg0;
        "variable.builtin" = purple;
        "variable.parameter" = fg0;
        "variable.other.member" = blue;
        "label" = aqua;
        "punctuation" = gray2;
        "punctuation.delimiter" = gray2;
        "punctuation.bracket" = gray2;
        "punctuation.special" = yellow;
        "keyword" = red;
        "keyword.control" = red;
        "keyword.directive" = aqua;
        "keyword.storage.modifier" = orange;
        "operator" = orange;
        "function" = green;
        "function.method" = aqua;
        "function.builtin" = green;
        "function.macro" = green;
        "tag" = yellow;
        "namespace" = aqua;
        "attribute" = blue;
        "constructor" = yellow;
        "module" = blue;
        "special" = orange;

        "markup.heading.marker" = gray2;
        "markup.heading.1" = {
          fg = red;
          modifiers = ["bold"];
        };
        "markup.heading.2" = {
          fg = orange;
          modifiers = ["bold"];
        };
        "markup.heading.3" = {
          fg = yellow;
          modifiers = ["bold"];
        };
        "markup.heading.4" = {
          fg = green;
          modifiers = ["bold"];
        };
        "markup.heading.5" = {
          fg = blue;
          modifiers = ["bold"];
        };
        "markup.heading.6" = {
          fg = fg0;
          modifiers = ["bold"];
        };
        "markup.list" = red;
        "markup.bold" = {modifiers = ["bold"];};
        "markup.italic" = {modifiers = ["italic"];};
        "markup.link.url" = {
          fg = blue;
          modifiers = ["underlined"];
        };
        "markup.link.text" = purple;
        "markup.quote" = gray2;
        "markup.raw" = green;

        "diff.plus" = green;
        "diff.delta" = orange;
        "diff.minus" = red;

        "ui.background" = {bg = bg;};
        "ui.background.separator" = gray0;
        "ui.cursor" = {
          fg = bg0;
          bg = fg1;
        };
        "ui.cursor.primary" = {
          fg = bg0;
          bg = fg0;
        };
        "ui.cursor.match" = {
          fg = orange;
          bg = bg_visual_yellow;
        };
        "ui.cursor.insert" = {
          fg = bg0;
          bg = gray2;
        };
        "ui.cursor.select" = {
          fg = bg0;
          bg = blue;
        };
        "ui.cursorline.primary" = {bg = bg2;};
        "ui.cursorline.secondary" = {bg = bg3;};
        "ui.selection" = {bg = bg3;};
        "ui.linenr" = gray0;
        "ui.linenr.selected" = fg0;
        "ui.statusline" = {
          fg = fg0;
          bg = bg3;
        };
        "ui.statusline.inactive" = {
          fg = gray0;
          bg = bg1;
        };
        "ui.statusline.normal" = {
          fg = bg0;
          bg = fg0;
          modifiers = ["bold"];
        };
        "ui.statusline.insert" = {
          fg = bg0;
          bg = yellow;
          modifiers = ["bold"];
        };
        "ui.statusline.select" = {
          fg = bg0;
          bg = blue;
          modifiers = ["bold"];
        };
        "ui.bufferline" = {
          fg = gray0;
          bg = bg1;
        };
        "ui.bufferline.active" = {
          fg = fg0;
          bg = bg3;
          modifiers = ["bold"];
        };
        "ui.popup" = {
          fg = gray2;
          bg = bg2;
        };
        "ui.window" = {
          fg = gray0;
          bg = bg2;
        };
        "ui.help" = {
          fg = fg0;
          bg = bg2;
        };
        "ui.text" = fg0;
        "ui.text.focus" = fg0;
        "ui.menu" = {
          fg = fg0;
          bg = bg3;
        };
        "ui.menu.selected" = {
          fg = bg0;
          bg = blue;
          modifiers = ["bold"];
        };
        "ui.virtual.whitespace" = {fg = bg4;};
        "ui.virtual.indent-guide" = {fg = bg4;};
        "ui.virtual.ruler" = {bg = bg3;};

        "hint" = blue;
        "info" = aqua;
        "warning" = yellow;
        "error" = red;
        "diagnostic" = {modifiers = ["underlined"];};
      };
    };
  };
}
