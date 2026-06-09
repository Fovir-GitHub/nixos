{pkgs, ...}: {
  home.packages = with pkgs.unixtools; [xxd];
}
