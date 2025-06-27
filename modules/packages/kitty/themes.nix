{ pkgs }:

let
  themes = {
    "gruvbox-dark" = ''
      # Gruvbox Dark
      background #282828
      foreground #ebdbb2
      selection_background #fabd2f
      selection_foreground #282828
      cursor #ebdbb2
      color0 #282828
      color1 #cc241d
      color2 #98971a
      color3 #d79921
      color4 #458588
      color5 #b16286
      color6 #689d6a
      color7 #a89984
      color8 #928374
      color9 #fb4934
      color10 #b8bb26
      color11 #fabd2f
      color12 #83a598
      color13 #d3869b
      color14 #8ec07c
      color15 #ebdbb2
    '';

    "catppuccin-mocha" = ''
      # Catppuccin Mocha
      background #1e1e2e
      foreground #cdd6f4
      selection_background #585b70
      selection_foreground #cdd6f4
      cursor #f5e0dc
      color0 #45475a
      color1 #f38ba8
      color2 #a6e3a1
      color3 #f9e2af
      color4 #89b4fa
      color5 #f5c2e7
      color6 #94e2d5
      color7 #bac2de
      color8 #585b70
      color9 #f38ba8
      color10 #a6e3a1
      color11 #f9e2af
      color12 #89b4fa
      color13 #f5c2e7
      color14 #94e2d5
      color15 #a6adc8
    '';

    "ayu-mirage" = ''
      # Ayu Mirage
      background #1f2430
      foreground #cbccc6
      selection_background #33415e
      selection_foreground #cbccc6
      cursor #ffcc66
      color0 #191e2a
      color1 #ed8274
      color2 #a6cc70
      color3 #fad07b
      color4 #6dcbfa
      color5 #cfbafa
      color6 #90e1c6
      color7 #c7c7c7
      color8 #686868
      color9 #f28779
      color10 #bae67e
      color11 #ffd580
      color12 #73d0ff
      color13 #d4bfff
      color14 #95e6cb
      color15 #ffffff
    '';
  };

  themeNames = builtins.attrNames themes;
in
pkgs.writeShellScript "kitty-theme-switch" ''
  CURRENT_THEME_FILE="$HOME/.config/kitty/current-theme.conf"

  case "$1" in
    "list")
      echo "Available themes:"
      ${builtins.concatStringsSep "\n" (map (name: "      echo \"  ${name}\"") themeNames)}
      exit 0
      ;;
    ${builtins.concatStringsSep "\n    " (map (name:
      "\"${name}\")\n      cat > \"$CURRENT_THEME_FILE\" << 'EOF'\n${themes.${name}}\nEOF\n      ;;"
    ) themeNames)}
    *)
      echo "Usage: kitty-theme [theme-name|list]"
      echo "Available themes: ${builtins.concatStringsSep ", " themeNames}"
      exit 1
      ;;
  esac

  echo "Theme '$1' applied! Restart kitty to see changes."
''
