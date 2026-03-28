{...}: {
  imports = [
    ./asm_lsp.nix
    ./clangd.nix
    ./cmake.nix
    ./cssls.nix
    ./golangci_lint_ls.nix
    ./gopls.nix
    ./html.nix
    ./jdtls.nix
    ./jsonls.nix
    ./just.nix
    ./lemminx.nix
    ./ltex.nix
    ./move_analyzer.nix
    ./nil.nix
    ./pyright.nix
    ./rust_analyzer.nix
    ./sqls.nix
    ./svelte.nix
    ./tailwindcss.nix
    ./ts_ls.nix
    ./yamlls.nix
  ];

  plugins.lsp.enable = true;
}
