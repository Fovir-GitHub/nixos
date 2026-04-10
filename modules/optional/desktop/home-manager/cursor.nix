{username}: {pkgs, ...}: {
  home-manager.users.${username} = {
    home = {
      pointerCursor = {
        hyprcursor = {
          enable = true;
          size = 24;
        };
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 24;
        gtk.enable = true;
        x11 = {
          enable = true;
          defaultCursor = "Bibata-Modern-Ice";
        };
      };
    };
  };
}
