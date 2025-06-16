{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Vishal Kumar";         # Change to your name
    userEmail = "kumarvishal823003@gmail.com";  # Change to your email

    aliases = {
      co = "checkout";
      br = "branch";
      ci = "commit";
      st = "status";
      lg = "log --oneline --graph --all";
    };

    extraConfig = {
      core.editor = "nvim";
      pull.rebase = false;
      init.defaultBranch = "main";
      credential.helper = "store";
    };
  };
}
