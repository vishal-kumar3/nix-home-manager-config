{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "docker" "npm" "fzf" ];
      theme = "robbyrussell";
    };


    shellAliases = {
      ll = "ls -l";
      update = "home-manager switch --flake /home/vishal/nix";
      project = "cd $HOME/Desktop/project";
    };
  };
}
