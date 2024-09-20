{
  programs.git = {
    enable = true;

    signing = {
      key = "BD2531BB4E59BB55";
      # signByDefault = true;
    };
    extraConfig = {
      push.autoSetupRemote = true;
      #   commit.gpgsign = true;
    };
  };

  # programs.gpg = {
  #   enable = true;
  # };

  # services.gpg-agent = {
  #   enable = true;
  # };
}
