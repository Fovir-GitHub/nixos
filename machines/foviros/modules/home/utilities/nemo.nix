{
  config,
  pkgs,
  ...
}: {
  home = {
    file.".local/bin/run-nemo" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash

        ( nohup nemo $1 >/dev/null 2>&1 & ) >/dev/null 2>&1
      '';
    };
    packages = [pkgs.nemo-with-extensions];
  };
  xdg.desktopEntries.nemo = {
    exec = "${config.home.homeDirectory}/.local/bin/run-nemo";
    icon = "nemo";
    name = "Nemo";
  };
  wayland.windowManager.hyprland.settings.bind = ["$mod,E,exec,nemo"];
}
