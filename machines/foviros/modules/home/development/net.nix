{pkgs, ...}: {
  home.packages = with pkgs; [
    net-tools
    traceroute
  ];
}
