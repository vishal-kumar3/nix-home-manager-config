{
  hostname,
  config,
  pkgs,
  ...
}:
{
  programs.zsh = {
    initContent = ''
      # Basic keybinds - Oh My Zsh handles most of this
      bindkey '^R' history-incremental-search-backward
    '';
  };
}
