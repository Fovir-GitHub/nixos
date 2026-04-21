{...}: {
  programs.opencode = {
    enable = true;

    tui.theme = "catppuccin-macchiato";
    settings = {
      autoupdate = true;
      provider = {
        ollama = {
          models = let
            mkModel = name: {
              name = name;
              value = {
                inherit name;
              };
            };
          in
            builtins.listToAttrs (map mkModel [
              "gpt-oss:20b"
              "qwen2.5-coder:14b"
              "qwen2.5-coder:32b-instruct-q3_K_S"
              "qwen3-coder:30b-a3b-q4_K_M"
            ]);
          name = "Ollama (local)";
          npm = "@ai-sdk/openai-compatible";
          options = {
            baseURL = "http://127.0.0.1:11434/v1";
          };
        };
      };
    };
  };
}
