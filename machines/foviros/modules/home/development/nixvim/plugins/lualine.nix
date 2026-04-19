{...}: {
  plugins.lualine = {
    enable = true;

    settings = {
      options.globalstatus = true;
      sections = {
        lualine_x = [
          {
            __unkeyed-1.__raw = ''
              require("noice").api.status.command.get
            '';
            cond.__raw = ''
              require("noice").api.status.command.has
            '';
            color = {fg = "#ff9e64";};
          }

          "encoding"
          "fileformat"
          "filetype"
        ];
      };
    };
  };
}
