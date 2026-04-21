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
    environmentVariables.OLLAMA_THREADS = "12";
    host = "0.0.0.0";
    loadModels = [
      "gemma3:12b"
      "gemma4:e4b"
      "gpt-oss:20b"
      "nomic-embed-text:v1.5"
      "qwen2.5-coder:32b-instruct-q3_K_S"
      "qwen3-coder:30b-a3b-q4_K_M"
      "qwen3-vl:30b"
      "qwen3.5:27b"
    ];
    syncModels = true;
  };
}
