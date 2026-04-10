{username}: let
  sciName = import ../../values/sci-name.nix;
in {
  programs = import ../../values/sci.nix;

  home-manager.users.${username}.wayland.windowManager = {
    hyprland.settings = {
      exec-once = [sciName];
      windowrule = [
        "workspace special, match:class .*${sciName}.*"
      ];
    };
    sway.config = {
      window.commands = [
        {
          command = "move scratchpad";
          criteria = {class = sciName;};
        }
      ];
      startup = [
        {
          command = sciName;
          always = true;
        }
      ];
    };
  };
}
