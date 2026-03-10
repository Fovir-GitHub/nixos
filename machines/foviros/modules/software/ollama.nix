{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "cuda_cccl"
      "cuda_cudart"
      "cuda_nvcc"
      "libcublas"
      "nvidia-settings"
      "nvidia-x11"
    ];

  services.ollama = {
    enable = true;

    package = pkgs.ollama-cuda;
    environmentVariables = {
      OLLAMA_CONTEXT_LENGTH = "64000";
    };
    host = "0.0.0.0";
    loadModels = [
      "gemma3:12b"
      "gpt-oss:20b"
      "llama3.2-vision:11b"
      "llama3.2:3b"
      "qwen2.5-coder:14b"
      "qwen2.5-coder:32b-instruct-q3_K_S"
      "qwen2.5-coder:32b-instruct-q4_0"
      "qwen3-coder:30b"
      "qwen3-coder:30b-a3b-q4_K_M"
      "qwen3-vl:30b"
      "qwen3.5:27b"
      "qwen3:30b"
      "translategemma:27b"
    ];
    syncModels = true;
  };
}
