{...}: {
  highlight = {
    IndentYellow = {bg = "#5f5f87";};
    IndentGreen = {bg = "#4f6a5f";};
    IndentRed = {bg = "#6a4f5f";};
    IndentBlue = {bg = "#4f5f7a";};
  };

  plugins.indent-blankline = {
    enable = true;

    settings = let
      highlight = [
        "IndentYellow"
        "IndentGreen"
        "IndentRed"
        "IndentBlue"
      ];
    in {
      indent = {
        char = "";
        smart_indent_cap = true;
        highlight = highlight;
      };
      whitespace = {
        highlight = highlight;
        remove_blankline_trail = false;
      };
      exclude.filetypes = ["dashboard"];
      scope = {
        enabled = true;
        show_exact_scope = true;
      };
    };
  };
}
