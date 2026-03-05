{...}: {
  home.file = {
    ".local/bin/disable_touchpad" = {
      text = ''
        #!/usr/bin/env bash
        hyprctl keyword "device[uniw0001:00-093a:0274-touchpad]:enabled" false
        notify-send -u low "Touchpad Disabled!"
      '';
      executable = true;
    };
    ".local/bin/enable_touchpad" = {
      text = ''
        #!/usr/bin/env bash
        hyprctl keyword "device[uniw0001:00-093a:0274-touchpad]:enabled" true
        notify-send -u low "Touchpad Enabled!"
      '';
      executable = true;
    };
  };

  wayland.windowManager.hyprland.settings = {
    bind = [
      "ALT,T,exec,disable_touchpad"
      "ALT_SHIFT,T,exec,enable_touchpad"
    ];
    exec-once = ["disable_touchpad"];
  };
}
