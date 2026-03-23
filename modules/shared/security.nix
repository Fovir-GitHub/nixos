{...}: {
  security = {
    sudo.enable = false;

    sudo-rs = {
      enable = true;

      execWheelOnly = true;
      extraConfig = ''
        Defaults !pwfeedback
      '';
      wheelNeedsPassword = true;
    };
  };
}
