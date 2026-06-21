{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    black
    google-java-format
    prettier
    prettier-plugin-go-template
    taplo
    xmlstarlet
    pgformatter
  ];

  home.file = {
    ".prettierrc".text = ''
      {
        "printWidth": 72
      }
    '';

    ".editorconfig".text = ''
      root = true

      [*]
      insert_final_newline = true
      end_of_line = lf
      charset = utf-8
    '';
  };
}
