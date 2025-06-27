{
  inputs,
  pkgs,
  ...
}:
{
  home.packages = (with pkgs; [ kitty ]);

  programs.kitty = {
    enable = true;

    # Font configuration
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 13.0;
    };

    settings = {
      # Font settings
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      # Window appearance
      window_border_width = "1pt";
      draw_minimal_borders = "yes";
      active_border_color = "#44ffff";

      # Theme integration
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/mykitty";

      # Other settings
      background_opacity = "0.95";
      confirm_os_window_close = 0;
    };

    # Include current theme
    extraConfig = ''
      include current-theme.conf
    '';
  };
}
