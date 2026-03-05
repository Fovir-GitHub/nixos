{
  config,
  pkgs,
  ...
}: {
  programs.waybar.enable = true;
  services.swaync = {
    enable = true;

    settings = {
      timeout = 3;
      timeout-low = 1;
    };
  };

  home = {
    file = let
      waybarConfigHome = "${config.xdg.configHome}/waybar";
    in {
      "${waybarConfigHome}/config.jsonc".source = ./config.jsonc;
      "${waybarConfigHome}/modules.json".source = ./modules.json;
      "${waybarConfigHome}/style.css".source = ./style.css;
    };
    packages = with pkgs; [
      libnotify
      networkmanagerapplet
    ];
  };

  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "nm-applet"
      "waybar"
    ];
    bind = [
      "$mod, D, exec, swaync-client -d -sw"
      "$mod, R, exec, pkill waybar; waybar &"
    ];
  };
}
