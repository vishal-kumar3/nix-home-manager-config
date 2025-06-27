{
  hostname,
  config,
  pkgs,
  ...
}:
{
  programs.zsh = {
    shellAliases = {
      # Utils
      c = "clear";
      cat = "bat";
      diff = "delta --diff-so-fancy --side-by-side";
      man = "BAT_THEME='default' batman";

      l = "eza --icons  -a --group-directories-first -1"; # EZA_ICON_SPACING=2
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";

      # Nixos
      update = "home-manager switch --flake /home/vishal/nix#vishal";

      # Directory
      project = "cd $HOME/Desktop/project";
      codenix = "cd $HOME/nix && code ."; 

      # Additional productivity aliases
      # Directory navigation
      cd = "z"; # zoxide
      cdi = "zi"; # interactive zoxide

      # Git productivity (removed gf - it's in git.nix)
      gstat = "git-cliff --unreleased --strip all";

      # Task management
      t = "task";
      ta = "task add";
      tl = "task list";

      # Code statistics
      loc = "tokei";

      # System info
      sysinfo = "neofetch";
    };
  };
}
