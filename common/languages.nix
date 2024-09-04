{pkgs, ...}: let
  arduino-yaml =
    if pkgs.stdenv.isDarwin == "x86_64-darwin"
    then "${builtins.getEnv "HOME"}/Library/Arduino15/arduino-cli.yaml"
    else "${builtins.getEnv "HOME"}/.arduino15/arduino-cli.yaml";
in {
  programs.helix.languages = {
    language-server = {
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
        args = ["-cli-config" arduino-yaml];
      };

      # java
      jdt.command = "jdt-language-server";

      # python
      pyright = {
        command = "pyright-langserver";
        args = ["--stdio" "--lib" "-p" "."];
        config = {};
      };

      ruff = {
        command = "ruff";
        args = ["server"];
      };

      # nix
      nil = {
        command = "nil";
        config.nil = {
          formatting.command = ["alejandra"];
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
        scope = "source.java";
        injection-regex = "java";
        file-types = ["java"];
        roots = ["pom.xml" "build.gradle"];
        indent = {
          tab-width = 4;
          unit = "    ";
        };
        language-servers = ["jdt"];
      }

      {
        name = "cpp";
        language-servers = ["arduino-lsp"];
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
            name = "pyright";
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
      }

      {
        name = "nix";
        language-servers = ["nil"];
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
