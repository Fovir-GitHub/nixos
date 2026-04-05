{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      grim
      jq
      kooha
      slurp
      swappy
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
