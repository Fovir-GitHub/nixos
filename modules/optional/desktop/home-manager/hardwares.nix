{username}: {pkgs, ...}: {
  home-manager.users.${username}.home.packages = with pkgs; [
    brightnessctl
    pamixer
    pulseaudio
    pwvucontrol
  ];
}
