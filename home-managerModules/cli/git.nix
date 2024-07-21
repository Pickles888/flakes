{
  config, 
  ...
}: {
  programs.git = {
    enable = true;
    userName = config.git.userName;
    userEmail = config.git.userEmail;
  };

  programs.gh.enable = true;
}
