{
  config,
  pkgs,
  ...
}: {
  home = {
    packages = with pkgs; [
      gnutar
      gzip
      p7zip
      peazip
      unzip
      zip
    ];
    file.".local/bin/run-peazip" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash

        ( nohup peazip $(realpath $1) >/dev/null 2>&1 & ) >/dev/null 2>&1
      '';
    };
  };

  xdg.desktopEntries.peazip = {
    exec = "${config.home.homeDirectory}/.local/bin/run-peazip";
    name = "PeaZip";
    icon = "peazip";
  };
}
