{...}: let
  kitty = "kitty";
in {
  programs.${kitty} = {
    enable = true;

    enableGitIntegration = true;
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 14;
    };
    keybindings = {
      "ctrl+0" = "change_font_size all 0";
      "ctrl+equal" = "change_font_size all +1.0";
      "ctrl+f" = "search_scrollback";
      "ctrl+minus" = "change_font_size all -1.0";
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
    };
    settings = {
      clear_all_shortcuts = "yes";
      term = "xterm-256color";
    };
    shellIntegration = {
      enableBashIntegration = true;
      enableZshIntegration = true;
      mode = "no-rc";
    };
    themeFile = "Catppuccin-Mocha";
  };
  wayland.windowManager.hyprland.settings.bind = [
    "$mod,T,exec,${kitty}"
    ",F1,exec,${kitty}"
  ];
}
