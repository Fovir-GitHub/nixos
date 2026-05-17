{...}: {
  highlight = {
    IndentYellow = {fg = "#5f5f87";};
    IndentGreen = {fg = "#4f6a5f";};
    IndentRed = {fg = "#6a4f5f";};
    IndentBlue = {fg = "#4f5f7a";};
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
        smart_indent_cap = true;
        highlight = highlight;
      };
      exclude.filetypes = ["dashboard"];
      scope = {
        enabled = true;
        highlight = ["Function"];
      };
    };
  };
}
