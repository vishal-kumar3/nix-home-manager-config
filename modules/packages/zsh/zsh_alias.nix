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

      # python
      piv = "python -m venv .venv";
      psv = "source .venv/bin/activate";

      # Directory
      project = "cd $HOME/Desktop/project";

      # Additional productivity aliases
      # System monitoring
      top = "bottom";
      htop = "bottom";
      ps = "procs";
      du = "dust";

      # Development
      lg = "lazygit";
      ld = "lazydocker";
      serve = "python -m http.server 8000";
      myip = "curl -s https://httpbin.org/ip | jq -r .origin";

      # JSON/YAML
      json = "fx";
      yaml = "yq";

      # Network
      http = "httpie";
      curl = "curlie";

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
