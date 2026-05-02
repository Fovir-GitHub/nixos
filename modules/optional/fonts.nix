{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      lxgw-wenkai
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-color-emoji
    ];

    fontconfig.defaultFonts = {
      emoji = ["Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font Mono" "LXGW WenKai Mono"];
      sansSerif = ["Noto Sans" "LXGW WenKai"];
      serif = ["Noto Serif" "LXGW WenKai"];
    };
  };
}
