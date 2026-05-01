{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      lxgw-wenkai
      nerd-fonts.jetbrains-mono
      noto-fonts-color-emoji
      sarasa-gothic
    ];

    fontconfig.defaultFonts = {
      emoji = ["Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font Mono" "LXGW WenKai Mono"];
      sansSerif = ["Sarasa Gothic SC"];
      serif = ["Sarasa Gothic SC"];
    };
  };
}
