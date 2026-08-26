{ ... }: {
  services.hermes-agent = {
    enable = true;

    installPackage = true;
    gateway.enable = false;
    environment = import ../../../values/hermes-agent-env.nix;
    settings = {
      model = {
        base_url = "https://opencode.ai/zen/v1/chat/completions";
        default = "hy3-free";
        provider = "opencode";
      };
      toolsets = [ "all" ];
      terminal = {
        backend = "local";
        timeout = 300;
        cwd = ".";
      };
      memory = {
        memory_enabled = true;
        user_profile_enabled = true;
      };
      display.compact = false;
      runtime.nofile_soft_limit = 4096;
    };
  };
}
