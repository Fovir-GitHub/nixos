{...}: {
  programs.opencode = {
    enable = true;

    settings = {
      autoupdate = true;
      theme = "catppuccin-macchiato";
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
              "qwen2.5-coder:32b-instruct-q4_0"
              "qwen3-coder:30b"
              "qwen3-coder:30b-a3b-q4_K_M"
              "qwen3-vl:30b"
              "qwen3:8b"
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
