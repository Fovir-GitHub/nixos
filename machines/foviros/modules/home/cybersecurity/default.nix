{pkgs, ...}: {
  home.packages = with pkgs; [
    dsniff
    ghidra
    nmap
    sqlmap
    zap
  ];
}
