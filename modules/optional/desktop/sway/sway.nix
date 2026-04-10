{pkgs, ...}: {
  home = {
    file = {
      ".local/bin/move-next" = {
        executable = true;
        text = ''
          current=$(swaymsg -t get_workspaces | ${pkgs.jq}/bin/jq '.[] | select(.focused) | .num')
          next=$((current + 1))
          swaymsg move container to workspace $next
          swaymsg workspace $next
        '';
      };
      ".local/bin/move-prev" = {
        executable = true;
        text = ''
          current=$(swaymsg -t get_workspaces | ${pkgs.jq}/bin/jq '.[] | select(.focused) | .num')
          prev=$((current - 1))
          if [ $prev -ge 1 ]; then
            swaymsg move container to workspace $prev
            swaymsg workspace $prev
          fi
        '';
      };
    };
    packages = with pkgs; [jq];
  };

  wayland.windowManager.sway = {
    enable = true;

    config = let
      mod = "Mod4";
    in {
      output = {
        "*" = {scale = "1.6";};
        "eDP-1" = {
          mode = "2560x1440@165Hz";
          position = "0 0";
        };
        "HDMI-A-1" = {
          mode = "2560x1600@130Hz";
          position = "1600 0";
          transform = "270";
        };
      };
      workspaceOutputAssign = [
        {
          output = "HDMI-A-1";
          workspace = "6";
        }
      ];
      bars = [{command = "waybar";}];
      gaps = {
        inner = 2;
        outer = 2;
        smartGaps = false;
      };
      window = {
        border = 2;
        titlebar = false;
        commands = [
          {
            command = "move scratchpad";
            criteria = {app_id = "strawberry";};
          }
          {
            command = "move scratchpad";
            criteria = {app_id = "thunderbird";};
          }
          {
            command = "fullscreen enable";
            criteria = {app_id = "btop";};
          }
          {
            command = "move scratchpad";
            criteria = {app_id = "org.keepassxc.KeePassXC";};
          }
        ];
      };
      workspaceLayout = "default";
      fonts = {
        names = ["JetBrainsMono Nerd Font Mono"];
        size = 14.0;
      };
      modifier = mod;
      keybindings = {
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+Shift+Space" = "move scratchpad";
        "${mod}+Tab" = "scratchpad show";
        "${mod}+b" = "exec kitty --app-id btop btop";
        "${mod}+bracketleft" = "exec move-prev";
        "${mod}+bracketright" = "exec move-next";
        "${mod}+comma" = "workspace prev";
        "${mod}+f" = "fullscreen toggle";
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        "${mod}+n" = "exec neovide";
        "${mod}+o" = "exec screenshot-ocr";
        "${mod}+p" = "exec swaylock";
        "${mod}+period" = "workspace next";
        "${mod}+q" = "kill";
        "${mod}+r" = "exec restart-waybar";
        "${mod}+s" = "exec screenshot-area";
        "${mod}+space" = "floating toggle";
        "--release Caps_Lock" = "exec swayosd-client --caps-lock";
        "Ctrl+Alt+Space" = "exec swayosd-client --playerctl play-pause";
        "Ctrl+Alt+n" = "exec playerctl next";
        "Ctrl+Alt+p" = "exec playerctl previous";
        "Mod1+space" = "exec fuzzel";
        "Print" = "exec screenshot-area";
        "XF86AudioLowerVolume" = "exec swayosd-client --output-volume -5";
        "XF86AudioMute" = "exec swayosd-client --output-volume mute-toggle";
        "XF86AudioRaiseVolume" = "exec swayosd-client --output-volume +5";
        "XF86MonBrightnessDown" = "exec swayosd-client --brightness -5";
        "XF86MonBrightnessUp" = "exec swayosd-client --brightness +5";
        "alt+tab" = "exec swayr switch-to-urgent-or-lru-window";
        "f1" = "exec kitty";
      };
      floating.modifier = mod;
      startup = let
        autostart = [
          "fcitx5 -d --replace"
          "fcitx5-remote -r"
          "keepassxc"
          "nm-applet"
          "strawberry"
          "swayrd"
          "thunderbird"
          "swaymsg focus output eDP-1"
        ];
      in
        map (command: {
          inherit command;
          always = true;
        })
        autostart;
      input."type:touchpad".events = "disabled";
    };
    extraConfig = ''
      seat * hide_cursor 1000
    '';
    extraOptions = ["--unsupported-gpu"];
    extraSessionCommands = ''
      export WLR_DRM_DEVICES=/dev/dri/card1:/dev/dri/card0
    '';
  };
}
