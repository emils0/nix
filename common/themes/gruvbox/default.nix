let
  color = import ./mix-dark-medium.nix;
in {
  programs.helix.themes.gruvbox_custom = {
    "type" = color.blue;
    "constant" = {
      fg = color.purple;
      modifiers = ["bold"];
    };
    "constant.character.escape" = color.yellow;
    "string" = color.green;
    "string.regexp" = color.blue;
    "comment" = {
      fg = color.gray0;
      modifiers = ["italic"];
    };
    "variable" = color.fg0;
    "variable.builtin" = {
      fg = color.purple;
      modifiers = ["italic"];
    };
    "variable.parameter" = color.fg0;
    "variable.other.member" = color.yellow;
    "label" = color.aqua;
    "punctuation" = color.gray2;
    "punctuation.delimiter" = color.gray2;
    "punctuation.special" = color.yellow;

    "punctuation.bracket" = color.gray2;
    "rainbow" = [color.gray2 color.orange color.blue color.purple color.orange color.blue color.purple color.orange color.blue color.purple];

    "keyword" = color.red;
    "keyword.directive" = color.aqua;
    "keyword.storage.modifier" = color.orange;
    "operator" = color.orange;
    "function" = color.green;
    "function.method" = color.aqua;
    "function.builtin" = color.green;
    "function.macro" = color.green;
    "tag" = color.yellow;
    "namespace" = color.aqua;
    "attribute" = color.blue;
    "constructor" = color.yellow;
    "module" = color.blue;
    "special" = color.orange;

    "diff.plus" = color.lightgreen;
    "diff.minus" = color.lightred;
    "diff.delta" = color.lightorange;
    "diff.delta.moved" = color.lightblue;

    "markup.heading.marker" = color.gray2;
    "markup.heading.1" = {
      fg = color.red;
      modifiers = ["bold"];
    };
    "markup.heading.2" = {
      fg = color.orange;
      modifiers = ["bold"];
    };
    "markup.heading.3" = {
      fg = color.yellow;
      modifiers = ["bold"];
    };
    "markup.heading.4" = {
      fg = color.green;
      modifiers = ["bold"];
    };
    "markup.heading.5" = {
      fg = color.blue;
      modifiers = ["bold"];
    };
    "markup.heading.6" = {
      fg = color.fg0;
      modifiers = ["bold"];
    };
    "markup.list" = color.red;
    "markup.bold" = {modifiers = ["bold"];};
    "markup.italic" = {modifiers = ["italic"];};
    "markup.link.url" = {
      fg = color.blue;
      modifiers = ["underlined"];
    };
    "markup.link.text" = color.purple;
    "markup.quote" = color.gray2;
    "markup.raw" = color.green;

    "ui.background.separator" = color.gray0;

    "ui.cursor" = {
      fg = color.bg0;
      bg = color.fg1;
    };
    "ui.cursor.primary" = {
      fg = color.bg0;
      bg = color.fg0;
    };
    "ui.cursor.match" = {
      fg = color.orange;
      bg = color.gray2;
    };
    "ui.cursor.insert" = {
      fg = color.bg0;
      bg = color.gray2;
    };
    "ui.cursor.select" = {
      fg = color.bg0;
      bg = color.blue;
    };

    "ui.cursorline.primary" = {bg = color.bg4;};
    "ui.cursorline.secondary" = {bg = color.bg;};

    "ui.selection" = {bg = color.bg1;};

    "ui.linenr" = color.gray0;
    "ui.linenr.selected" = color.fg0;

    "ui.statusline" = {
      fg = color.fg0;
      bg = color.bg3;
    };
    "ui.statusline.inactive" = {
      fg = color.gray0;
      bg = color.bg2;
    };
    "ui.statusline.normal" = {
      fg = color.bg0;
      bg = color.blue;
      modifiers = ["bold"];
    };
    "ui.statusline.insert" = {
      fg = color.bg0;
      bg = color.green;
      modifiers = ["bold"];
    };
    "ui.statusline.select" = {
      fg = color.bg0;
      bg = color.purple;
      modifiers = ["bold"];
    };

    "ui.bufferline" = {
      fg = color.gray0;
      bg = color.bg1;
    };
    "ui.bufferline.active" = {
      fg = color.fg0;
      bg = color.bg3;
      modifiers = ["bold"];
    };

    "ui.popup" = {
      fg = color.gray2;
      bg = color.bg2;
    };
    "ui.window" = {
      fg = color.gray0;
      bg = color.bg2;
    };
    "ui.help" = {
      fg = color.fg0;
      bg = color.bg2;
    };

    "ui.text" = color.fg0;
    "ui.text.focus" = color.fg0;

    "ui.menu" = {
      fg = color.fg0;
      bg = color.bg3;
    };
    "ui.menu.selected" = {
      fg = color.bg0;
      bg = color.blue;
      modifiers = ["bold"];
    };
    "ui.menu.scroll" = {
      fg = color.fg1;
      bg = color.bg;
    };

    "ui.virtual.whitespace" = {fg = color.bg4;};
    "ui.virtual.indent-guide" = {fg = color.bg4;};
    "ui.virtual.ruler" = {bg = color.bg3;};
    "ui.virtual.inlay-hint" = {fg = color.gray0;};
    "ui.virtual.jump-label" = {
      bg = color.purple;
      fg = color.bg0;
      modifiers = ["bold"];
    };

    "hint" = color.blue;
    "info" = color.aqua;
    "warning" = color.yellow;
    "error" = color.red;
    "diagnostic" = {modifiers = ["underlined"];};
  };
}
