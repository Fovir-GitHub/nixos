{ pkgs, ... }:
let
  iconPathPrefix = "${pkgs.beauty-line-icon-theme}/share/icons/BeautyLine/apps/scalable";
  successIcon = "${iconPathPrefix}/gnome-info.svg";
  failedIcon = "${iconPathPrefix}/error.svg";
in
{
  programs.zsh = {
    enable = true;

    autocd = true;
    autosuggestion.enable = true;
    defaultKeymap = "viins";
    enableCompletion = true;
    history.size = 10000;
    syntaxHighlighting.enable = true;
    shellAliases = {
      cb = "cargo build";
      cbr = "cargo build --release";
      cbrv = "cargo build --release --verbose";
      cbv = "cargo build --verbose";
      cf = "cargo fix --allow-dirty --allow-staged --tests";
      cp = "cp -v";
      cr = "cargo run";
      crv = "cargo run --verbose";
      ct = "cargo test";
      ctv = "cargo test --verbose";
      f = "fg";
      gc = "git commit --verbose -s";
      gfo = "git fetch origin";
      gfu = "git fetch upstream";
      gpa = "git push --all";
      gpt = "git push --tags";
      gpwt = "git push && git push --tags";
      grau = "git remote add upstream";
      grsp = "git restore -p";
      gs = "git switch";
      gsc = "git switch --create";
      gsd = "git switch $(git_develop_branch)";
      gsm = "git switch $(git_main_branch)";
      gst = "git status --untracked-files";
      gtd = "git tag --delete";
      h = "hermes";
      j = "just";
      la = "eza -a --color=always --group-directories-first --icons=always"; # All files and dirs.
      ll = "eza -l --color=always --group-directories-first --icons=always"; # Long format.
      ls = "eza -alF --color=always --group --group-directories-first --icons=always"; # Preferred listing.
      lt = "eza -aT --color=always --group-directories-first --icons=always"; # Tree listing.
      mv = "mv --verbose";
      n = "nvim";
      o = "xdg-open"; # Open.
      oc = "opencode";
      open = "xdg-open"; # Open.
      rm = "rm -v";
      tmp = "cd $(mktemp -d)";
    };

    initContent = ''
      autoload -U promptinit; promptinit
      PURE_GIT_STASH_SYMBOL='$'
      zstyle :prompt:pure:environment:nix-shell show no
      zstyle :prompt:pure:git:dirty detailed yes
      zstyle :prompt:pure:git:stash show yes
      prompt pure

      set -o vi
      bindkey -M viins '^H' backward-kill-word

      function zle-keymap-select {
        if [[ ''${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
          echo -ne '\e[1 q'
        elif [[ ''${KEYMAP} == main ]] || [[ ''${KEYMAP} == viins ]] || [[ ''${KEYMAP} = "" ]] || [[ $1 = 'beam' ]]; then
          echo -ne '\e[5 q'
        fi
      }
      zle -N zle-keymap-select

      zle-line-init() {
          zle -K viins
          echo -ne "\e[5 q"
      }
      zle -N zle-line-init

      echo -ne '\e[5 q'

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
