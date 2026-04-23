{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    (lib.hiPrio gopls)
    go
    gofumpt
    golangci-lint
    gotools
    govulncheck
  ];
}
