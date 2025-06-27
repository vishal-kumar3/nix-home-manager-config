{ themeScript, pkgs }:

{
  # Font size adjustment
  "ctrl+shift+plus" = "change_font_size all +1.0";
  "ctrl+shift+minus" = "change_font_size all -1.0";
  "ctrl+shift+backspace" = "change_font_size all 0";

  # Theme switching
  "ctrl+shift+t" = "launch --type=overlay sh -c '${themeScript} list && echo \"\" && echo \"Usage: kitty-theme [theme-name]\" && read -p \"Press Enter to continue...\"'";

  # Tab management
  "ctrl+shift+enter" = "new_tab";
  "ctrl+tab" = "next_tab";
  "ctrl+shift+tab" = "previous_tab";
  "ctrl+shift+w" = "close_tab";

  # Window/Split management
  "ctrl+shift+d" = "new_window";
  "ctrl+shift+q" = "close_window";
  "alt+left" = "previous_window";
  "alt+right" = "next_window";

  # Copy/Paste
  "ctrl+shift+c" = "copy_to_clipboard";
  "ctrl+shift+v" = "paste_from_clipboard";

  # Search
  "ctrl+shift+f" = "show_scrollback";
  "ctrl+f" = "launch --type=overlay --stdin-source=@screen_scrollback ${pkgs.fzf}/bin/fzf --no-sort --no-mouse --exact -i";

  # Clear screen
  "ctrl+shift+k" = "clear_terminal reset active";

  # Scrolling
  "ctrl+up" = "scroll_line_up";
  "ctrl+down" = "scroll_line_down";
  "ctrl+home" = "scroll_home";
  "ctrl+end" = "scroll_end";
}
