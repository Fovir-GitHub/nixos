{username}: {pkgs, ...}: {
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;

    fcitx5 = {
      addons = with pkgs; [
        fcitx5-gtk
        fcitx5-rime
        libsForQt5.fcitx5-qt
      ];
      waylandFrontend = true;
    };
  };

  home-manager.users.${username} = {
    wayland.windowManager.hyprland.settings.exec-once = [
      "fcitx5-remote -r"
      "fcitx5 -d --replace &"
    ];

    xdg = let
      ctpThemes = pkgs.fetchFromGitHub {
        owner = "Fovir-GitHub";
        repo = "ctp-fcitx5";
        rev = "main";
        sha256 = "sha256-Hhd+V7b5Wp7+SvImNdFk1TjiFUZp+araBxjCpIdi9sQ=";
      };
    in {
      configFile = {
        "fcitx5/conf/classicui.conf".text = ''
          Theme=catppuccin-mocha-lavender
        '';
        "fcitx5/conf/rime.conf".text = ''
          # Preedit Mode
          PreeditMode="Inline"
          # Fix embedded preedit cursor at the beginning of the preedit
          PreeditCursorPositionAtBeginning=False
          # Action when switching input method
          # SwitchInputMethodBehavior="Commit commit preview"
          # Deploy
          Deploy=
          # Synchronize
          Synchronize=
        '';
      };
      dataFile = {
        "fcitx5/rime" = {
          force = true;
          recursive = true;
          source = pkgs.fetchFromGitHub {
            hash = "sha256-eKHGJ8oioBncKntA8kuDuH6qXFfMHFwXJuUBlkCLn4w=";
            owner = "iDvel";
            repo = "rime-ice";
            rev = "5f130b4fbc9a228dea9c9ad25597d4bab284ee1d";
          };
        };
        "fcitx5/themes".source = "${ctpThemes}/src";
      };
    };
  };
}
