{monitor-config}: {...}: {
  wayland.windowManager.hyprland = {
    enable = true;

    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };
    settings = {
      monitor =
        [",preferred,auto,1"]
        ++ monitor-config;
      xwayland.force_zero_scaling = true;
      "$mod" = "SUPER";
      bind = [
        "$mod,Q,killactive" # Kill current process.
        # Move focus.
        "$mod,H,movefocus,l"
        "$mod,J,movefocus,d"
        "$mod,K,movefocus,u"
        "$mod,L,movefocus,r"
        # Switch workspace.
        "$mod,period,workspace,e+1"
        "$mod,comma,workspace,e-1"
        "$mod,1,workspace,1"
        "$mod,2,workspace,2"
        "$mod,3,workspace,3"
        "$mod,4,workspace,4"
        "$mod,5,workspace,5"
        "$mod,6,workspace,6"
        "$mod,7,workspace,7"
        "$mod,8,workspace,8"
        "$mod,9,workspace,9"
        "$mod,TAB,exec,hyprctl dispatch togglespecialworkspace"
        # Move the window to workspace.
        "$mod,bracketright,movetoworkspace,+1"
        "$mod,bracketleft,movetoworkspace,-1"
        # Make the window full screen.
        "$mod,F,fullscreenstate,2 0"
        "$mod SHIFT,F,fullscreen, 0"
        # Toggle float window.
        "$mod,SPACE,togglefloating"
      ];
      bindm = [
        "$mod,mouse:272,movewindow" # Move window.
        "$mod, mouse:273,resizewindow" # Resize window.
      ];
      bindl = [
        # Volume control.
        ",XF86AudioRaiseVolume,exec,swayosd-client --output-volume +5"
        ",XF86AudioLowerVolume,exec,swayosd-client --output-volume -5"
        ",XF86AudioMute,exec,swayosd-client --output-volume mute-toggle"
        # Brightness control.
        ",XF86MonBrightnessUp,exec, brightnessctl set +5%"
        ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
      ];
      general = {
        "col.active_border" = "rgba(5e9bf388)";
        "col.inactive_border" = "rgba(ffffff22)";
        border_size = 3;
        gaps_in = 2;
        gaps_out = 4;
      };
      decoration = {
        active_opacity = 1.0;
        fullscreen_opacity = 1.0;
        inactive_opacity = 0.96;
        rounding = 12;
        blur = {
          enabled = true;

          brightness = 1.0;
          contrast = 0.9;
          ignore_opacity = false;
          new_optimizations = true;
          noise = 0.03;
          passes = 3;
          size = 11;
          vibrancy = 0.15;
          vibrancy_darkness = 0.1;
        };
        shadow = {
          enabled = true;

          color = "rgba(00000066)";
          ignore_window = false;
          offset = "0, 4";
          range = 18;
          render_power = 3;
          scale = 0.97;
        };
      };
      input = {
        numlock_by_default = true;
        touchpad.natural_scroll = true;
      };
      cursor = {
        inactive_timeout = 4;
        hide_on_key_press = true;
      };
      ecosystem = {
        no_donation_nag = true;
        no_update_news = true;
      };
      bezier = ["macReal, 0.26, 0.06, 0.22, 1.00"];
      animation = [
        "border,1,8,default"
        "borderangle,0"
        "fade,1,6,macReal"
        "fadeDim,0"
        "layers,1,4.5,macReal,slide top"
        "specialWorkspace,1,5,macReal,slidevert"
        "windows,1,4.5,macReal,slide"
        "windowsIn,1,3.8,macReal,popin 95%"
        "windowsMove,1,4.5,macReal,slide"
        "windowsOut,1,3.0,macReal,popin"
        "workspaces,1,5.2,macReal,slide"
      ];
    };
  };

  home.file.".local/bin/workspaces2monitor" = {
    executable = true;
    force = true;
    text = ''
      #!/usr/bin/env bash
      if [ $# -ne 1 ]; then
        echo "Usage: workspaces2monitor <monitor-name>"
        echo ""
        echo "Available monitors:"
        hyprctl monitors all | grep '^Monitor'
        exit 1
      fi

      for i in {1..20}; do hyprctl dispatch moveworkspacetomonitor $i $1; done
    '';
  };
}
