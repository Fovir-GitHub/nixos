{pkgs, ...}: {
  home.packages = with pkgs; [
    go
    gofumpt
    golangci-lint
    gopls
    gotools
    govulncheck
  ];
}
