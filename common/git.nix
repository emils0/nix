{ pkgs, ... }: {
  programs.git = {
    enable = true;

    # Changed from extraConfig to settings
    settings = {
      push.autoSetupRemote = true;
      user = {
        name = "Your Name";
        email = "your.email@example.com";
      };
    };
  };

  # Difftastic moved to its own program
  programs.difftastic = {
    enable = true;
    git.enable = true;  # Explicitly enable git integration
    options = {
      display = "inline";  # or whatever you had
      # other options
    };
  };
}
