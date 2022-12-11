let
  theme = import ./themes/gruvbox/material-dark-medium.nix;
in {
  programs.helix.themes = {
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
}
