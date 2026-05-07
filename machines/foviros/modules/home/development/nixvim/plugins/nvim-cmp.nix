{...}: {
  plugins.cmp = {
    enable = true;

    autoEnableSources = true;
    filetype = {
      c.sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "luasnip";}
      ];
      cpp.sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "luasnip";}
      ];
      java.sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "luasnip";}
      ];
      rust.sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "luasnip";}
      ];
      go.sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "luasnip";}
      ];
      scss.sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "luasnip";}
      ];
      html.sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "emmet";}
        {name = "luasnip";}
        {name = "buffer";}
      ];
      gitcommit.sources = [
        {name = "conventionalcommits";}
        {name = "path";}
        {name = "buffer";}
      ];
      markdown.sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "buffer";}
        {name = "vimtex";}
        {
          name = "latex_symbols";
          option.strategy = 2;
        }
      ];
      tex.sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "buffer";}
        {name = "vimtex";}
        {
          name = "latex_symbols";
          option.strategy = 2;
        }
      ];
    };

    settings = {
      completion.autocomplete = ["require('cmp.types').cmp.TriggerEvent.TextChanged"];

      sources = [
        {name = "nvim_lsp";}
        {name = "path";}
        {name = "buffer";}
      ];

      snippet.expand = ''
        function(args)
          require('luasnip').lsp_expand(args.body)
        end
      '';

      sorting.comparators = [
        "require('cmp.config.compare').exact"
        "require('cmp.config.compare').offset"
        "require('cmp.config.compare').score"
        "require('cmp.config.compare').sort_text"
        "require('cmp.config.compare').recently_used"
        "require('cmp.config.compare').length"
        "require('cmp.config.compare').order"
      ];

      mapping = {
        "<Down>" = "cmp.mapping.select_next_item()";
        "<Up>" = "cmp.mapping.select_prev_item()";

        # Configure tab out.
        "<Tab>" = ''
          function(fallback)
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            local col = vim.fn.col(".")
            local line = vim.fn.getline(".")

            local next_char = ""
            if col <= #line then
              next_char = line:sub(col,col)
            end

            local jump_chars = {
              ["("]=true, [")"]=true,
              ["{"]=true, ["}"]=true,
              ["["]=true, ["]"]=true,
              ["<"]=true, [">"]=true,
              ['"']=true, ["'"]=true,
              ["`"]=true, [";"]=true,
              ["*"]=true, ["$"]=true,
             }

            if cmp.visible() then
              cmp.confirm({select = true})
            elseif jump_chars[next_char] then
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, true, true), "i", true)
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end
        '';

        "<CR>" = "cmp.mapping.confirm({ select = true })";
      };
    };
  };

  plugins = {
    cmp-latex-symbols.enable = true;
    cmp-vimtex.enable = true;
  };
}
