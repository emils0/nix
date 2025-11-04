{pkgs, ...}: let
  arduino-yaml =
    if pkgs.stdenv.isDarwin
    then "/Users/emil/Library/Arduino15/arduino-cli.yaml"
    else "${builtins.getEnv "HOME"}/.arduino15/arduino-cli.yaml";
in {
  programs.helix.languages = {
    language-server = {
      # Emmet
      emmet = {
        command = "emmet-ls";
        args = ["--stdio"];
      };

      # Typst
      tinymist = {
        config = {
          exportPdf = "onType";
          outputPath = "$root/target/$dir/$name";
        };
      };

      # arduino
      arduino-lsp = {
        command = "arduino-language-server";
        args = ["-cli-config" arduino-yaml "-cli" "arduino-cli"];
      };

      # python
      pyright = {
        command = "pyright-langserver";
        args = ["--stdio" "--lib" "-p" "."];
        config = {};
      };

      basedpyright.roots = ["pyproject.toml" "setup.py" "Poetry.lock" "."];
      basedpyright.config.basedpyright = {
        analysis.typeCheckingMode = "standard";
        analysis.diagnosticMode = "workspace";
        analysis.logLevel = "Error";
        analysis.useLibraryCodeForType = true;
        analysis.autoImportCompletions = true;
        disableOrganizeImports = true;
      };

      ruff = {
        command = "ruff";
        args = ["server"];
      };

      # nix
      nil = {
        command = "nil";
        config.nil = {
          nix = {
            maxMemoryMB = 5120;
            flake.autoArchive = true;
            flake.autoEvalInputs = true;
          };
        };
      };

      # writing
      ltex.command = "ltex-ls";

      # dart
      dart = {
        command = "dart";
        args = ["language-server" "--client-id=helix"];
        config.closingLabels = true;
      };
    };

    language = [
      {
        name = "java";
        auto-format = true;
      }

      {
        name = "cpp";
        language-servers = [
          {
            name = "arduino-lsp";
            except-features = ["inlay-hints"];
          }
        ];
        scope = "source.arduino";
        roots = ["sketch.yaml"];
        auto-format = true;
        formatter.command = "clang-format";
      }

      {
        name = "python";
        auto-format = true;
        language-servers = [
          {
            name = "ruff";
            only-features = ["format" "diagnostics" "code-action"];
          }
          {
            name = "basedpyright";
            except-features = ["format"];
          }
        ];
      }

      {
        name = "html";
        formatter = {
          command = "prettier";
          args = ["--parser" "html"];
        };
        language-servers = ["vscode-html-language-server" "emmet"];
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
        language-servers = ["vscode-css-language-server" "emmet"];
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
        language-servers = ["marksman"];
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
        formatter.command = "fish_indent";
        auto-format = true;
      }

      {
        name = "c-sharp";
        auto-format = true;
        language-servers = ["csharp-ls"];
      }

      {
        name = "svelte";
        auto-format = true;
        language-servers = ["svelteserver" "emmet"];
      }

      {
        name = "nix";
        formatter.command = "alejandra";
        language-servers = [
          {
            name = "nil";
            except-features = ["format"];
          }
        ];

        auto-format = true;
      }

      {
        name = "elixir";
        formatter.command = "mix format";
        auto-format = true;
      }

      {
        name = "dockerfile";
        formatter.command = "dockfmt fmt";
        auto-format = true;
      }
    ];
  };
}
