{
  username,
  monitor-config ? [],
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  imports = [
    (import ../../fcitx5.nix {inherit username;})
    (import ../home-manager {inherit username;})
    ../../fonts.nix
    ../services
  ];

  home-manager.users.${username} = {pkgs, ...}: {
    imports = [
      (import ./hyprland.nix {inherit monitor-config;})
      ./hyprlock.nix
      ./hyprpaper.nix
      ./hyprshell
      ./waybar
    ];
    services.hyprpolkitagent.enable = true;
    xdg.portal = {
      enable = true;

      config.common.default = "hyprland";
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-hyprland
      ];
    };
  };
}
