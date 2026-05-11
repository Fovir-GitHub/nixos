{username}: {
  home-manager.users.${username} = {config, ...}: {
    xdg = {
      enable = true;

      configHome = "${config.home.homeDirectory}/.config";
      dataHome = "${config.home.homeDirectory}/.local/share";
      stateHome = "${config.home.homeDirectory}/.local/state";
      userDirs = {
        enable = true;

        createDirectories = false;
        documents = "$HOME/Documents";
        download = "$HOME/Downloads";
        music = "$HOME/Music";
        pictures = "$HOME/Pictures";
        videos = "$HOME/Videos";
        desktop = "$HOME/Desktop";
        templates = "/var/empty";
        publicShare = "/var/empty";
        extraConfig = {
          XDG_PROJECTS_DIR = "$HOME/Projects";
          XDG_GAMES_DIR = "$HOME/Games";
          XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
        };
      };
      mimeApps = let
        archiver = ["peazip.desktop"];
        browser = ["librewolf.desktop"];
        filemanager = ["nemo.desktop"];
        image-viewer = ["oculante.desktop"];
        libreoffice-calc = ["libreoffice-calc.desktop"];
        libreoffice-presentation = ["libreoffice-impress.desktop"];
        libreoffice-writer = ["libreoffice-writer.desktop"];
        video-player = ["mpv.desktop"];
      in {
        enable = true;

        defaultApplications = {
          "x-scheme-handler/about" = filemanager;
          "x-scheme-handler/ftp" = filemanager;
          "inode/directory" = filemanager;

          "image/*" = image-viewer;
          "image/avif" = image-viewer;
          "image/gif" = image-viewer;
          "image/jpeg" = image-viewer;
          "image/png" = image-viewer;
          "image/webp" = image-viewer;

          "audio/*" = video-player;
          "video/*" = video-player;

          "application/pdf" = browser;
          "x-scheme-handler/http" = browser;
          "x-scheme-handler/https" = browser;
          "text/html" = browser;

          "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = libreoffice-writer;
          "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = libreoffice-calc;
          "application/vnd.openxmlformats-officedocument.presentationml.presentation" = libreoffice-presentation;

          "application/gzip" = archiver;
          "application/vnd.rar" = archiver;
          "application/x-7z-compressed" = archiver;
          "application/x-tar" = archiver;
          "application/zip" = archiver;
        };
      };
    };
  };
}
