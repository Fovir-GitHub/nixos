{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      grim
      jq
      kooha
      slurp
      tesseract
    ];
    file = {
      ".local/bin/screenshot-ocr" = {
        executable = true;
        text = ''
          #!/usr/bin/env bash

          grim -g "$(slurp)" - | tesseract -l "eng" stdin stdout | wl-copy;notify-send "OCR content copied to clipboard"
        '';
      };
      ".local/bin/screenshot-area" = {
        executable = true;
        text = ''
          #!/usr/bin/env bash

          grim -g "$(slurp)" - | swappy -f -
        '';
      };
    };
  };

  programs.swappy = {
    enable = true;
    settings.Default = {
      auto_save = false;
      early_exit = true;
      fill_shape = false;
      line_size = 5;
      paint_mode = "brush";
      save_dir = "$HOME/Pictures/Screenshots";
      save_filename_format = "SCREENSHOT-%Y-%m-%d-%H:%M:%S.png";
      show_panel = false;
      text_size = 20;
    };
  };

  wayland.windowManager.hyprland.settings = {
    bind = let
      screenshot-command = "screenshot-area";
      ocr-command = "screenshot-ocr";
    in [
      "$mod,S,exec,${screenshot-command}"
      ",Print,exec,${screenshot-command}"
      "$mod,O,exec,${ocr-command}"
    ];
    layerrule = ["animation fade, match:namespace .*selection.*"];
  };
}
