{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      lxgw-wenkai
      nerd-fonts.jetbrains-mono
    ];

    fontconfig.defaultFonts = {
      monospace = ["JetBrainsMono Nerd Font Mono" "LXGW WenKai Mono"];
      sansSerif = ["JetBrainsMono Nerd Font Mono" "LXGW WenKai Mono"];
      serif = ["JetBrainsMono Nerd Font Mono" "LXGW WenKai Mono"];
    };
  };
}
