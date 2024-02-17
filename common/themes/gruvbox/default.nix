let
  gruvbox = import ./material-dark-medium.nix;
in {
  programs.helix.themes = {
    gruvbox_custom = {
      "type" = gruvbox.blue;
      "constant" = gruvbox.purple;
      "constant.builtin" = gruvbox.purple;
      "constant.character.escape" = gruvbox.yellow;
      "constant.numeric" = gruvbox.purple;
      "string" = gruvbox.green;
      "string.regexp" = gruvbox.blue;
      "comment" = gruvbox.gray0;
      "variable" = gruvbox.fg0;
      "variable.builtin" = gruvbox.purple;
      "variable.parameter" = gruvbox.fg0;
      "variable.other.member" = gruvbox.yellow;
      "label" = gruvbox.aqua;
      "punctuation" = gruvbox.gray2;
      "punctuation.delimiter" = gruvbox.gray2;
      "punctuation.bracket" = gruvbox.gray2;
      "punctuation.special" = gruvbox.yellow;
      "keyword" = gruvbox.red;
      "keyword.directive" = gruvbox.aqua;
      "keyword.storage.modifier" = gruvbox.orange;
      "operator" = gruvbox.orange;
      "function" = gruvbox.green;
      "function.method" = gruvbox.aqua;
      "function.builtin" = gruvbox.green;
      "function.macro" = gruvbox.green;
      "tag" = gruvbox.yellow;
      "namespace" = gruvbox.aqua;
      "attribute" = gruvbox.blue;
      "constructor" = gruvbox.yellow;
      "module" = gruvbox.blue;
      "special" = gruvbox.orange;

      "diff.plus" = gruvbox.lightgreen;
      "diff.minus" = gruvbox.lightred;
      "diff.delta" = gruvbox.lightorange;
      "diff.delta.moved" = gruvbox.lightblue;

      "markup.heading.marker" = gruvbox.gray2;
      "markup.heading.1" = {
        fg = gruvbox.red;
        modifiers = ["bold"];
      };
      "markup.heading.2" = {
        fg = gruvbox.orange;
        modifiers = ["bold"];
      };
      "markup.heading.3" = {
        fg = gruvbox.yellow;
        modifiers = ["bold"];
      };
      "markup.heading.4" = {
        fg = gruvbox.green;
        modifiers = ["bold"];
      };
      "markup.heading.5" = {
        fg = gruvbox.blue;
        modifiers = ["bold"];
      };
      "markup.heading.6" = {
        fg = gruvbox.fg0;
        modifiers = ["bold"];
      };
      "markup.list" = gruvbox.red;
      "markup.bold" = {modifiers = ["bold"];};
      "markup.italic" = {modifiers = ["italic"];};
      "markup.link.url" = {
        fg = gruvbox.blue;
        modifiers = ["underlined"];
      };
      "markup.link.text" = gruvbox.purple;
      "markup.quote" = gruvbox.gray2;
      "markup.raw" = gruvbox.green;

      # "ui.background" = {bg = gruvbox.bg;};
      "ui.background.separator" = gruvbox.gray0;
      "ui.cursor" = {
        fg = gruvbox.bg0;
        bg = gruvbox.fg1;
      };
      "ui.cursor.primary" = {
        fg = gruvbox.bg0;
        bg = gruvbox.fg0;
      };
      "ui.cursor.match" = {
        fg = gruvbox.orange;
        bg = gruvbox.gray2;
      };
      "ui.cursor.insert" = {
        fg = gruvbox.bg0;
        bg = gruvbox.gray2;
      };
      "ui.cursor.select" = {
        fg = gruvbox.bg0;
        bg = gruvbox.blue;
      };
      "ui.cursorline.primary" = {bg = gruvbox.bg4;};
      "ui.cursorline.secondary" = {bg = gruvbox.bg;};
      "ui.selection" = {bg = gruvbox.bg3;};
      "ui.linenr" = gruvbox.gray0;
      "ui.linenr.selected" = gruvbox.fg0;
      "ui.statusline" = {
        fg = gruvbox.fg0;
        bg = gruvbox.bg3;
      };
      "ui.statusline.inactive" = {
        fg = gruvbox.gray0;
        bg = gruvbox.bg2;
      };
      "ui.statusline.normal" = {
        fg = gruvbox.bg0;
        bg = gruvbox.fg0;
        modifiers = ["bold"];
      };
      "ui.statusline.insert" = {
        fg = gruvbox.bg0;
        bg = gruvbox.yellow;
        modifiers = ["bold"];
      };
      "ui.statusline.select" = {
        fg = gruvbox.bg0;
        bg = gruvbox.blue;
        modifiers = ["bold"];
      };
      "ui.bufferline" = {
        fg = gruvbox.gray0;
        bg = gruvbox.bg1;
      };
      "ui.bufferline.active" = {
        fg = gruvbox.fg0;
        bg = gruvbox.bg3;
        modifiers = ["bold"];
      };
      "ui.popup" = {
        fg = gruvbox.gray2;
        bg = gruvbox.bg2;
      };
      "ui.window" = {
        fg = gruvbox.gray0;
        bg = gruvbox.bg2;
      };
      "ui.help" = {
        fg = gruvbox.fg0;
        bg = gruvbox.bg2;
      };
      "ui.text" = gruvbox.fg0;
      "ui.text.focus" = gruvbox.fg0;
      "ui.menu" = {
        fg = gruvbox.fg0;
        bg = gruvbox.bg3;
      };
      "ui.menu.selected" = {
        fg = gruvbox.bg0;
        bg = gruvbox.blue;
        modifiers = ["bold"];
      };
      "ui.virtual.whitespace" = {fg = gruvbox.bg4;};
      "ui.virtual.indent-guide" = {fg = gruvbox.bg4;};
      "ui.virtual.ruler" = {bg = gruvbox.bg3;};
      "ui.virtual.inlay-hint" = {fg = gruvbox.gray0;};

      "hint" = gruvbox.blue;
      "info" = gruvbox.aqua;
      "warning" = gruvbox.yellow;
      "error" = gruvbox.red;
      "diagnostic" = {modifiers = ["underlined"];};
    };
  };
}
