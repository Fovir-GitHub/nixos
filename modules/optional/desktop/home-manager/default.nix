{username}: {...}: {
  imports = [
    (import ./cursor.nix {inherit username;})
    (import ./qt {inherit username;})
    (import ./xdg.nix {inherit username;})
    (import ./gtk.nix {inherit username;})
    (import ./fuzzel.nix {inherit username;})
    (import ./hardwares.nix {inherit username;})
  ];
}
