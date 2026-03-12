{pkgs, ...}: {
  home.packages = [pkgs.koreader];
  xdg.desktopEntries.koreader = {
    exec = "koreader %u";
    icon = "koreader";
    name = "KOReader";
  };
}
