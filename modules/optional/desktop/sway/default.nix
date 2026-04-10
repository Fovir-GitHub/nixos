{username}: {
  pkgs,
  lib,
  ...
}: {
  environment.pathsToLink = ["/share/applications" "/share/xdg-desktop-portal"];
  imports = [
    (import ../../fcitx5.nix {inherit username;})
    (import ../home-manager {inherit username;})
    ../../fonts.nix
    ../services
  ];
  programs.dconf.enable = true;
  security.pam.services.swaylock = {};
  services.greetd.settings.default_session.command = lib.mkForce "${pkgs.tuigreet}/bin/tuigreet -t -c sway --user-menu";
  home-manager.users.${username} = {pkgs, ...}: {
    home.packages = with pkgs; [xprop];
    programs.swayr.enable = true;
    services.autotiling.enable = true;
    services.polkit-gnome.enable = true;
    xdg.portal = {
      enable = true;
      config.common.default = ["gtk"];
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
      ];
    };
    imports = [
      ./sway.nix
      ./swaylock.nix
      ./waybar
    ];
  };
}
