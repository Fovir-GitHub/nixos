{...}: {
  plugins.nvim-surround = {
    enable = true;

    settings.surrounds = {
      "(" = {
        add = ["(" ")"];
        delete = "^(. ?)().-( ?.)()$";
        find.__raw = ''
          function()
            return M.get_selection({ motion = "a(" })
          end
        '';
      };
      "[" = {
        add = ["[" "]"];
        delete = "^(. ?)().-( ?.)()$";
        find.__raw = ''
          function()
            return M.get_selection({ motion = "a[" })
          end
        '';
      };
      "{" = {
        add = ["{" "}"];
        delete = "^(. ?)().-( ?.)()$";
        find.__raw = ''
          function()
            return M.get_selection({ motion = "a{" })
          end
        '';
      };
      "<" = {
        add = ["<" ">"];
        delete = "^(. ?)().-( ?.)()$";
        find.__raw = ''
          function()
            return M.get_selection({ motion = "a<" })
          end
        '';
      };
    };
  };

  keymaps = [
    {
      action = "<Plug>(nvim-surround-visual)";
      key = "S";
      mode = ["x"];
      options.desc = "[S]urround";
    }
  ];
}
