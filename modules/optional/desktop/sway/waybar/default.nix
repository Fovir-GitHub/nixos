{
  config,
  pkgs,
  ...
}: {
  programs = {
    waybar.enable = true;
    wlogout = {
      enable = true;

      layout = [
        {
          label = "lock";
          action = "hyprlock";
          text = "Lock";
          keybind = "l";
        }
        {
          label = "reboot";
          action = "reboot";
          text = "Reboot";
          keybind = "r";
        }
        {
          label = "shutdown";
          action = "poweroff";
          text = "Power off";
          keybind = "p";
        }
      ];
    };
  };

  services = {
    swaync = {
      enable = true;

      settings = {
        timeout = 5;
        timeout-low = 3;
      };
    };
    swayosd.enable = true;
  };

  home = {
    file = let
      waybarConfigHome = "${config.xdg.configHome}/waybar";
    in {
      "${waybarConfigHome}/config.jsonc".source = ./config.jsonc;
      "${waybarConfigHome}/modules.json".source = ./modules.json;
      "${waybarConfigHome}/style.css".source = ./style.css;
      ".local/bin/restart-waybar" = {
        executable = true;
        text = ''
          #!/usr/bin/env bash
          pkill waybar; waybar &
        '';
      };
    };
    packages = with pkgs; [
      libnotify
      networkmanagerapplet
      pwvucontrol
    ];
  };

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "blueman-applet"
      "nm-applet"
      "waybar"
    ];
    bind = [
      "$mod, D, exec, swaync-client -d -sw"
      "$mod, R, exec, pkill waybar; waybar &"
    ];
    layerrule = [
      "animation fade, match:namespace .*logout_dialog.*"
      "animation fade, match:namespace .*swayosd.*"
    ];
  };
}
