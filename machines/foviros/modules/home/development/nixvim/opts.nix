{pkgs, ...}: {
  extraConfigVim = ''
    set clipboard+=unnamedplus
  '';

  extraConfigLua = ''
    vim.g.neovide_floating_blur_amount_x = 1.0
    vim.g.neovide_floating_blur_amount_y = 1.0
    vim.g.neovide_opacity = 1.0
    vim.g.neovide_normal_opacity = 1.0
    vim.o.shell="${pkgs.zsh}/bin/zsh"
    vim.g.user_emmet_expandabbr_key = "<M-,>";

    function _G.MyFoldText()
      local startLine = vim.fn.getline(vim.v.foldstart)
      local endLine = vim.v.foldend
      local nLines = endLine - vim.v.foldstart + 1
      return string.format("%s +%d lines", startLine:gsub("%s*$", ""), nLines)
    end
  '';

  opts = {
    # Configure tab behaviours.
    tabstop = 4;
    shiftwidth = 4;
    softtabstop = 4;
    expandtab = true;
    # Show line number and relative line number.
    number = true;
    relativenumber = true;
    # Use terminal's color.
    termguicolors = true;
    # Automatically indent and smart indent.
    autoindent = true;
    smartindent = true;
    # Highlight current line.
    cursorline = true;
    # Search with case-insenstive.
    ignorecase = true;
    smartcase = true;
    # Enable spell check.
    spelllang = "en_US";
    formatoptions = "croq";
    # Enable line wrap.
    wrap = true;
    linebreak = true;
    # Max columns to highlight syntax.
    synmaxcol = 200;
    # Fold settings.
    foldenable = true;
    foldexpr = "v:lua.vim.treesitter.foldexpr()";
    foldlevel = 99;
    foldlevelstart = 99;
    foldmethod = "expr";
    foldtext = "v:lua.MyFoldText()";
  };

  filetype.extension = {"tmpl" = "gotmpl";};
}
