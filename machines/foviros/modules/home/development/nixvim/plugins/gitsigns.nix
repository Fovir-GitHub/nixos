{...}: {
  extraConfigLua = ''
    vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {
      fg = "#a6adc8",
      italic = true,
    })
  '';

  plugins.gitsigns = {
    enable = true;

    settings = {
      current_line_blame = false;
      current_line_blame_opts = {
        delay = 500;
        ignore_whitespace = true;
        virt_text = true;
        virt_text_pos = "eol";
      };
      update_debounce = 100;
    };
  };

  keymaps = [
    {
      action = "<cmd>Gitsigns diffthis<CR>";
      key = "<leader>dt";
      mode = "n";
      options.desc = "[D]iff [T]his";
    }
  ];
}
