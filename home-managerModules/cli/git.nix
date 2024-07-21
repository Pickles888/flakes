{
  osConfig, 
  ...
}: {
  programs.git = {
    enable = true;
    userName = osConfig.git.userName;
    userEmail = osConfig.git.userEmail;
  };

  programs.gh.enable = true;
}
