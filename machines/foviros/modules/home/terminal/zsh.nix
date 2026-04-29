{pkgs, ...}: let
  iconPathPrefix = "${pkgs.beauty-line-icon-theme}/share/icons/BeautyLine/apps/scalable";
  successIcon = "${iconPathPrefix}/gnome-info.svg";
  failedIcon = "${iconPathPrefix}/error.svg";
in {
  programs.zsh = {
    enable = true;

    autocd = true;
    autosuggestion.enable = true;
    defaultKeymap = "viins";
    enableCompletion = true;
    history.size = 10000;
    syntaxHighlighting.enable = true;
    shellAliases = {
      cp = "cp -v";
      gfo = "git fetch origin";
      gfu = "git fetch upstream";
      gpa = "git push --all";
      gpt = "git push --tags";
      gpwt = "git push && git push --tags";
      gs = "git switch";
      gsc = "git switch --create";
      gsd = "git switch $(git_develop_branch)";
      gsm = "git switch $(git_main_branch)";
      gst = "git status --untracked-files";
      gtd = "git tag --delete";
      j = "just";
      la = "eza -a --color=always --group-directories-first --icons=always"; # All files and dirs.
      ll = "eza -l --color=always --group-directories-first --icons=always"; # Long format.
      ls = "eza -alF --color=always --group --group-directories-first --icons=always"; # Preferred listing.
      lt = "eza -aT --color=always --group-directories-first --icons=always"; # Tree listing.
      mv = "mv --verbose";
      open = "xdg-open"; # Open.
      rm = "rm -v";
      tmp = "cd $(mktemp -d)";
    };

    initContent = ''
      eval "$(starship init zsh)"

      set -o vi
      bindkey -M viins '^H' backward-kill-word

      bgnotify_threshold=10
      function bgnotify_formatted {
        ## $1=exit_status, $2=command, $3=elapsed_time
        local elapsed="$(( $3 % 60 ))s"
        (( $3 < 60 ))   || elapsed="$((( $3 % 3600) / 60 ))m $elapsed"
        (( $3 < 3600 )) || elapsed="$((  $3 / 3600 ))h $elapsed"

        [ $1 -eq 0 ] && icon="${successIcon}" || icon="${failedIcon}"
        bgnotify "took ''${elapsed}" "$2" "$icon"
      }
    '';

    oh-my-zsh = {
      enable = true;

      plugins = [
        "bgnotify"
        "git"
      ];
    };
  };
}
