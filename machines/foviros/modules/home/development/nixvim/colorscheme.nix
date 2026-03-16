{...}: {
  colorschemes = {
    catppuccin = {
      enable = false;

      settings = {
        flavour = "mocha";
        transparent_background = false;
        term_colors = true;
        default_integrations = true;
        integrations = {
          cmp = true;
          neotree = true;
          telescope.enabled = true;
          dashboard = true;
        };
        background.dark = "mocha";
      };
    };
    tokyonight = {
      enable = true;

      settings = {
        plugins = {
          all = true;
          auto = true;
        };
        style = "night";
        styles = {
          comments.italic = true;
          keywords.italic = false;
        };
        terminal_colors = true;
        transparent = false;
      };
    };
  };
}
