{
  inputs,
  pkgs,
  ...
}:
{
  home.packages = (with pkgs; [ obsidian ]);
}
