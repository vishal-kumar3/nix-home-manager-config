{
  hostname,
  config,
  pkgs,
  ...
}:
{
  programs.zsh = {
    initExtra = ''
      # Basic keybinds - Oh My Zsh handles most of this
      bindkey '^R' history-incremental-search-backward
    '';
  };
}
