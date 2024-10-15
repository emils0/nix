{
  programs.git = {
    enable = true;
    difftastic.enable = true;
    difftastic.display = "inline";

    extraConfig = {
      push.autoSetupRemote = true;
    };
  };
}
