{ ... }: {
  programs = {
    git = {
      enable = true;

      settings = {
        commit.gpgsign = true;
        diff.algorithm = "histogram";
        format.signoff = true;
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
        rebase.autoStash = true;
        rerere.enabled = false;
        tag.gpgSign = true;
        user = import ../../../values/git-user.nix;
      };
    };

    lazygit.enable = true;

    gh = {
      enable = true;

      settings.git_protocol = "ssh";
    };
  };
}
