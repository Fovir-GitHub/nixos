{
  config,
  pkgs,
  ...
}: {
  programs.keepassxc.enable = true;
  services.ssh-agent.enable = true;

  home.file = {
    "${config.xdg.configHome}/keepassxc/keepassxc.ini" = {
      force = true;
      mutable = true;
      text = ''
        [Browser]
        Enabled=true

        [GUI]
        ApplicationTheme=dark
        MinimizeOnClose=true
        MinimizeToTray=true
        ShowTrayIcon=true
        TrayIconAppearance=colorful

        [General]
        MinimizeAfterUnlock=false

        [Security]
        LockDatabaseIdle=true
        LockDatabaseIdleSeconds=43200

        [SSHAgent]
        Enabled=true
        UseOpenSSH=false
      '';
    };

    ".mozilla/native-messaging-hosts/org.keepassxc.keepassxc_browser.json" = {
      force = true;
      mutable = true;
      text = ''
        {
            "name": "org.keepassxc.keepassxc_browser",
            "description": "KeePassXC integration with native messaging support",
            "path": "${pkgs.keepassxc}/bin/keepassxc-proxy",
            "type": "stdio",
            "allowed_extensions": [
                "keepassxc-browser@keepassxc.org"
            ]
        }
      '';
    };

    ".librewolf/native-messaging-hosts/org.keepassxc.keepassxc_browser.json" = {
      force = true;
      mutable = true;
      text = ''
        {
            "name": "org.keepassxc.keepassxc_browser",
            "description": "KeePassXC integration with native messaging support",
            "path": "${pkgs.keepassxc}/bin/keepassxc-proxy",
            "type": "stdio",
            "allowed_extensions": [
                "keepassxc-browser@keepassxc.org"
            ]
        }
      '';
    };
  };

  wayland.windowManager.hyprland.settings = let
    keepassxc = "keepassxc";
  in {
    exec-once = [keepassxc];
    windowrule = ["workspace special, match:class .*${keepassxc}.*"];
  };
}
