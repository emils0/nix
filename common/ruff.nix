{
  programs.ruff = {
    enable = true;

    settings.lint = {
      per-file-ignores = {"__init__.py" = ["F401"];};
      select = [
        "E"
        "W" # Pycodestyle errors and warnings (also checks docstrings.)
        "C901" # McCabe complexity check (should never exceed 10.)
        "F" # Pyflakes error analysis.
        "N" # PEP8 naming convention check.
        "Q" # Flake8-quotes, checks for quote and string related issues.
        "SLF" # Checks for private member access.
        "SIM" # Checks for code that can be easily simplified.
        "B" # Flake8-bugbear which looks for likely bugs and design problems.
        "RUF" # Rules and checks that are specific to Ruff.
        "FURB" # Checks for code that should be refurbished, due to using old Python conventions.
        "UP" # Checks for outdated and deprecated code (can always fix it for you.)
        "RET" # Checks for useless returns or assignments in functions.
        "FA100" # Incorrect use of typing check (like using List/Dict instead of list/dict.)
        "PIE"
        "PERF"
      ];

      pydocstyle.convention = "google";
      extend-ignore = ["E501" "N818" "B006" "RUF015" "D202" "D100" "D101" "D105" "D107" "RET503" "TCH002" "SIM112"];

      flake8-annotations = {
        allow-star-arg-any = true; # Allows untyped *args and **kwargs.
        suppress-dummy-args = true; # Ignores type annotations from dummy arguments.
        suppress-none-returning = true; # Allows functions that don't return anything to not hint return type.
      };
    };
    settings.target-version = "py312";
  };
}
