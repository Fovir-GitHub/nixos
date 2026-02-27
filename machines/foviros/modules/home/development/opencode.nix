{...}: {
  programs.opencode = {
    enable = true;

    settings = {
      autoupdate = true;
      theme = "opencode";
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
              "qwen3-coder:30b"
              "qwen3-vl:30b"
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
