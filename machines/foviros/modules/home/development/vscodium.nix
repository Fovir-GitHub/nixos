{pkgs, ...}: {
  programs.vscode = {
    enable = true;

    package = pkgs.vscodium;
    profiles.default = {
      extensions = with pkgs.vscode-marketplace; [
        albert.tabout
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        esbenp.prettier-vscode
        ibm.zopeneditor
        jock.svg
        movebit.sui-move-analyzer
        mysten.move
        vscodevim.vim
        zowe.vscode-extension-for-zowe
      ];
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      userSettings = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.fontFamily" = "JetBrainsMono Nerd Font Mono";
        "editor.fontLigatures" = true;
        "editor.fontSize" = 16;
        "editor.formatOnPaste" = true;
        "editor.formatOnSave" = true;
        "editor.formatOnType" = true;
        "editor.lineNumbers" = "relative";
        "editor.wordWrap" = "on";
        "editor.wrappingStrategy" = "advanced";
        "svg.preview.autoShow" = true;
        "vim.highlightedyank.enable" = true;
        "vim.useSystemClipboard" = true;
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "catppuccin-mocha";
      };
    };
  };
}
