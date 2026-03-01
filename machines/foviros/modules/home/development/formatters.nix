{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    black
    google-java-format
    prettier
    prettier-plugin-go-template
    taplo
    xmlstarlet
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
      indent_style = space
      indent_size = 2
      trim_trailing_whitespace = true
      insert_final_newline = true
      end_of_line = lf
      charset = utf-8

      [*.{c,cpp,h,hpp,go,rs,py}]
      indent_size = 4
    '';
  };
}
