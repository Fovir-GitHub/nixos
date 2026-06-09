{pkgs, ...}: let
  batTheme = "Catppuccin Mocha";
in {
  imports = [
    ./bash.nix
    ./fastfetch
    ./kitty.nix
    ./pure-prompt.nix
    ./scripts.nix
    ./zsh.nix
  ];

  home = {
    packages = with pkgs; [
      dust
      file
      onefetch
      openssl
      rclone
      rename
      rsync
      tldr
      tokei
      wl-clipboard-rs
    ];
    sessionVariables.BAT_THEME = batTheme;
    shell.enableZshIntegration = true;
  };

  programs = {
    bat = {
      enable = true;

      config.theme = batTheme;
    };
    btop = {
      enable = true;

      settings = {
        color_theme = "horizon";
        vim_keys = true;
      };
    };
    eza.enable = true;
    fd.enable = true;
    htop.enable = true;
    ripgrep.enable = true;
    yazi.enable = true;
    zoxide.enable = true;
  };

  wayland.windowManager.hyprland.settings.bind = [
    "$mod, B, exec, [fullscreen] kitty btop"
    "$mod, Y, exec, kitty yazi"
  ];
}
