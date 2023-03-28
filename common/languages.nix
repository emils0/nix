{
  programs.helix.languages = [
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
      language-server.command = "jdt-language-server -data ~/.cache/";
    }

    {
      name = "python";
      auto-format = true;
      config.pylsp = {
        plugins.rope_completion.enabled = true;
        plugins.rope_autoimport.enabled = true;
        plugins.flake8.maxLineLength = 88;
      };
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
      formatter.command = "fish_indent";
      auto-format = true;
    }

    {
      name = "c-sharp";
      auto-format = true;
    }

    {
      name = "svelte";
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

    {
      name = "elixir";
      formatter.command = "mix format";
      auto-format = true;
    }
  ];
}
