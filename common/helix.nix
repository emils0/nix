{
  programs.helix = {
    enable = true;

    settings = {
      theme = "gruvbox_mix_dark_medium";

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

      {
        name = "c-sharp";
        auto-format = true;
      }
    ];

    themes = {
      gruvbox_mix_dark_medium =
        let
          bg0 = "#282828";
          bg1 = "#32302f";
          bg2 = "#32302f";
          bg3 = "#45403d";
          bg4 = "#45403d";
          bg5 = "#5a524c";
          bg_statusline1 = "#32302f";
          bg_statusline2 = "#3a3735";
          bg_statusline3 = "#504945";
          bg_diff_green = "#34381b";
          bg_visual_green = "#3b4439";
          bg_diff_red = "#402120";
          bg_visual_red = "#4c3432";
          bg_diff_blue = "#0e363e";
          bg_visual_blue = "#374141";
          bg_visual_yellow = "#4f422e";
          bg_current_word = "#3c3836";

          fg0 = "#e2cca9";
          fg1 = "#e2cca9";
          red = "#f2594b";
          orange = "#f28534";
          yellow = "#e9b143";
          green = "#b0b846";
          aqua = "#8bba7f";
          blue = "#80aa9e";
          purple = "#d3869b";
          bg_red = "#db4740";
          bg_green = "#b0b846";
          bg_yellow = "#e9b143";

          grey0 = "#7c6f64";
          grey1 = "#928374";
          grey2 = "#a89984";
        in
        {

          "type" = yellow;
          "constant" = purple;
          "constant.numeric" = purple;
          "constant.character.escape" = orange;
          "string" = green;
          "string.regexp" = blue;
          "comment" = grey0;
          "variable" = fg0;
          "variable.builtin" = blue;
          "variable.parameter" = fg0;
          "variable.other.member" = fg0;
          "label" = aqua;
          "punctuation" = grey2;
          "punctuation.delimiter" = grey2;
          "punctuation.bracket" = fg0;
          "keyword" = red;
          "keyword.directive" = aqua;
          "operator" = orange;
          "function" = green;
          "function.builtin" = blue;
          "function.macro" = aqua;
          "tag" = yellow;
          "namespace" = aqua;
          "attribute" = aqua;
          "constructor" = yellow;
          "module" = blue;
          "special" = orange;

          "markup.heading.marker" = grey2;
          "markup.heading.1" = { fg = red; modifiers = [ "bold" ]; };
          "markup.heading.2" = { fg = orange; modifiers = [ "bold" ]; };
          "markup.heading.3" = { fg = yellow; modifiers = [ "bold" ]; };
          "markup.heading.4" = { fg = green; modifiers = [ "bold" ]; };
          "markup.heading.5" = { fg = blue; modifiers = [ "bold" ]; };
          "markup.heading.6" = { fg = fg0; modifiers = [ "bold" ]; };
          "markup.list" = red;
          "markup.bold" = { modifiers = [ "bold" ]; };
          "markup.italic" = { modifiers = [ "italic" ]; };
          "markup.link.url" = { fg = blue; modifiers = [ "underlined" ]; };
          "markup.link.text" = purple;
          "markup.quote" = grey2;
          "markup.raw" = green;

          "diff.plus" = green;
          "diff.delta" = orange;
          "diff.minus" = red;

          "ui.background" = { bg = bg0; };
          "ui.background.separator" = grey0;
          "ui.cursor" = { fg = bg0; bg = fg0; };
          "ui.cursor.match" = { fg = orange; bg = bg_visual_yellow; };
          "ui.cursor.insert" = { fg = bg0; bg = grey2; };
          "ui.cursor.select" = { fg = bg0; bg = blue; };
          "ui.cursorline.primary" = { bg = bg1; };
          "ui.cursorline.secondary" = { bg = bg1; };
          "ui.selection" = { bg = bg3; };
          "ui.linenr" = grey0;
          "ui.linenr.selected" = fg0;
          "ui.statusline" = { fg = fg0; bg = bg3; };
          "ui.statusline.inactive" = { fg = grey0; bg = bg1; };
          "ui.statusline.normal" = { fg = bg0; bg = fg0; modifiers = [ "bold" ]; };
          "ui.statusline.insert" = { fg = bg0; bg = yellow; modifiers = [ "bold" ]; };
          "ui.statusline.select" = { fg = bg0; bg = blue; modifiers = [ "bold" ]; };
          "ui.bufferline" = { fg = grey0; bg = bg1; };
          "ui.bufferline.active" = { fg = fg0; bg = bg3; modifiers = [ "bold" ]; };
          "ui.popup" = { fg = grey2; bg = bg2; };
          "ui.window" = { fg = grey0; bg = bg0; };
          "ui.help" = { fg = fg0; bg = bg2; };
          "ui.text" = fg0;
          "ui.text.focus" = fg0;
          "ui.menu" = { fg = fg0; bg = bg3; };
          "ui.menu.selected" = { fg = bg0; bg = blue; modifiers = [ "bold" ]; };
          "ui.virtual.whitespace" = { fg = bg4; };
          "ui.virtual.indent-guide" = { fg = bg4; };
          "ui.virtual.ruler" = { bg = bg3; };

          "hint" = blue;
          "info" = aqua;
          "warning" = yellow;
          "error" = red;
          "diagnostic" = { modifiers = [ "underlined" ]; };
        };
    };
  };
}
