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
    modus = {
      enable = true;

      settings = {
        line_nr_column_background = false;
        style = "modus_vivendi";
        styles = {
          comments.italic = true;
          constants.bold = true;
          functions.bold = true;
          keywords.italic = true;
          numbers.bold = true;
        };
        transparent = false;
        on_highlights = ''
          function(hl, colors)
            hl.FloatBorder = { fg = colors.border }
            hl.LineNr = { fg = colors.fg_dim, bg = colors.bg_main }
            hl.NeoTreeCursorLine = { bg = colors.bg_active }
            hl.NeoTreeDirectoryName = { fg = colors.blue, bold = true }
            hl.NeoTreeFileName = { fg = colors.fg_main }
            hl.NeoTreeFileNameOpened = { fg = colors.magenta, bold = true }
            hl.NeoTreeGitAdded = { fg = colors.green }
            hl.NeoTreeGitDeleted = { fg = colors.red }
            hl.NeoTreeGitIgnored = { fg = colors.fg_inactive }
            hl.NeoTreeGitModified = { fg = colors.yellow }
            hl.NeoTreeGitUntracked = { fg = colors.cyan }
            hl.NeoTreeIndentMarker = { fg = colors.fg_inactive }
            hl.NeoTreeNormal = { bg = colors.bg_main, fg = colors.fg_main }
            hl.NeoTreeNormalNC = { bg = colors.bg_dim, fg = colors.fg_dim }
            hl.NeoTreeRootName = { fg = colors.magenta, bold = true }
            hl.NeoTreeWinSeparator = { fg = colors.border }
            hl.NormalFloat = { bg = colors.bg_dim }
            hl.SignColumn = { bg = colors.bg_main }
          end
        '';
      };
    };
    tokyonight = {
      enable = false;

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
