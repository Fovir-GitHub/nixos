{...}: {
  keymaps = [
    {
      action = "<C-w>";
      key = "<C-BS>";
      mode = ["i" "t"];
      options.desc = "Delete a Word";
    }
    {
      action = "<cmd>lua require('mini.bufremove').delete(0, false)<CR>";
      key = "<leader>w";
      mode = "n";
      options.desc = "Close Current Buffer";
    }
    {
      action = "<cmd>bufdo bd<CR>";
      key = "<leader>W";
      mode = "n";
      options.desc = "Close All Buffers";
    }
    {
      action = "<C-w>v";
      key = "<leader>v";
      mode = "n";
      options.desc = "Split Tab [V]ertically";
    }
    {
      action = "<C-w>s";
      key = "<leader>h";
      mode = "n";
      options.desc = "Split Tab [H]orizontally";
    }
    {
      action = "<C-w>w";
      key = "<leader>fl";
      mode = "n";
      options.desc = "Enter [FL]oat Window";
    }
    {
      action = "<C-w>q";
      key = "<leader>q";
      mode = "n";
      options.desc = "Close Splited Tab";
    }
    {
      action = "<cmd>set wrap!<CR>";
      key = "<M-z>";
      mode = "n";
      options.desc = "Toggle Line Wrap";
    }
    {
      action = "<cmd>Telescope lsp_definitions<CR>";
      key = "gd";
      mode = "n";
      options.desc = "[G]o to [D]efinition";
    }
    {
      action = "<cmd>WhichKey<CR>";
      key = "<leader>?";
      mode = "n";
      options.desc = "Open which-key";
    }
    {
      action = "<cmd>:nohlsearch<CR>";
      key = "<Esc>";
      mode = "n";
      options.desc = "Disable Highlight After Search";
    }
    {
      action = "zM";
      key = "zC";
      mode = "n";
      options.desc = "Close All Folds";
    }
    {
      action = "zR";
      key = "zO";
      mode = "n";
      options.desc = "Open All Folds";
    }
    {
      action = "<cmd>!cd %:p:h && live-server --entry-file=%:t -q &<CR>";
      key = "<leader>lss";
      mode = "n";
      options.desc = "[L]ive [S]erver [S]tart";
    }
    {
      action = "<cmd>!pkill live-server<CR>";
      key = "<leader>lsk";
      mode = "n";
      options.desc = "[L]ive [S]erver [K]ill";
    }
    {
      action = "<cmd>Dashboard<CR>";
      key = "<leader>D";
      mode = "n";
      options.desc = "[D]ashboard";
    }
    {
      action = "<cmd>set spell<CR>";
      key = "<leader>spt";
      mode = "n";
      options.desc = "[SP]ell [T]rue";
    }
    {
      action = "<cmd>set nospell<CR>";
      key = "<leader>spf";
      mode = "n";
      options.desc = "[SP]ell [F]alse";
    }
    {
      action.__raw = ''
        function()
          local ls = require("luasnip")
          if ls.expand_or_jumpable() then
            ls.unlink_current()
          end
          return "<Esc>";
        end
      '';
      key = "<Esc>";
      mode = [
        "i"
        "s"
      ];
      options = {
        desc = "Unlink Luasnip Jump";
        expr = true;
      };
    }
    {
      action.__raw = ''
        function()
          return vim.fn.strftime("%F")
        end
      '';
      key = "<C-r>t";
      mode = "i";
      options = {
        desc = "Put Current Time in YYYY-MM-DD Format";
        expr = true;
      };
    }
    {
      action.__raw = ''
        function()
          return vim.fn.expand("%:.")
        end
      '';
      key = "<C-r>rp";
      mode = "i";
      options = {
        desc = "[R]elative [P]ath of Current File";
        expr = true;
      };
    }
    {
      action.__raw = ''
        function()
          return vim.fn.expand("%:t:r")
        end
      '';
      key = "<C-r>fn";
      mode = "i";
      options = {
        desc = "[F]ile [N]ame";
        expr = true;
      };
    }
    {
      action = ":sort<CR>";
      key = "<leader>s";
      mode = "v";
      options.desc = "[S]ort";
    }
    {
      action = "<C-\\><C-n>";
      mode = "t";
      key = "<M-Esc>";
      options.desc = "Terminal -> Normal";
    }
  ];
}
