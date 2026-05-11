{...}: {
  plugins.telescope = {
    enable = true;

    extensions = {
      fzf-native.enable = true;
      ui-select.enable = true;
    };
    settings = {
      defaults = {
        path_display = ["truncate"];
        vimgrep_arguments = [
          "rg"
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
          "--hidden"
          "--glob"
          "!**/.git/*"
        ];
      };
      pickers = {
        buffers = {
          ignore_current_buffer = false;
          initial_mode = "normal";
          select_current = true;
          sort_mru = true;
        };
        find_files.find_command = [
          "rg"
          "--files"
          "--hidden"
          "--glob"
          "!**/.git/*"
        ];
      };
    };
    keymaps = {
      "<leader><Tab>" = {
        action = "buffers";
        mode = "n";
        options.desc = "Select Buffer";
      };
      "<leader>b" = {
        action = "buffers";
        mode = "n";
        options.desc = "[B]uffers";
      };
      "<leader>ff" = {
        action = "find_files";
        mode = "n";
        options.desc = "[F]ind [F]iles";
      };
      "<leader>gbc" = {
        action = "git_bcommits";
        mode = "n";
        options.desc = "[G]it [B]uffer [C]ommits";
      };
      "<leader>gbr" = {
        action = "git_branches";
        mode = "n";
        options.desc = "[G]it [BR]anch";
      };
      "<leader>gc" = {
        action = "git_commits";
        mode = "n";
        options.desc = "[G]it [C]ommits";
      };
      "<leader>gst" = {
        action = "git_status";
        mode = "n";
        options.desc = "[G]it [ST]atus";
      };
      "<leader>st" = {
        action = "live_grep";
        mode = "n";
        options.desc = "[S]earch [T]ext";
      };
      "<leader>tr" = {
        action = "resume";
        mode = "n";
        options.desc = "[T]elescope [R]esume";
      };
    };
  };
}
