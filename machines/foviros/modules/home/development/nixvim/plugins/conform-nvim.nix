{...}: {
  plugins.conform-nvim = {
    enable = true;

    settings = {
      format_on_save = ''
        function(bufnr)
          return {lsp_fallback = true}
        end
      '';

      formatters_by_ft = {
        "_" = ["prettier"];
        "c" = ["clang_format"];
        "cpp" = ["clang_format"];
        "go" = ["gofumpt"];
        "java" = ["google-java-format"];
        "nix" = ["alejandra"];
        "python" = ["black"];
        "rust" = ["rustfmt"];
        "tex" = ["latexindent"];
        "toml" = ["taplo"];
      };
      formatters.gofumpt.append_args = ["-extra"];
    };
  };
}
