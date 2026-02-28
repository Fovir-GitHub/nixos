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
    loadModels = [
      "gemma3:12b"
      "gpt-oss:20b"
      "lfm2:24b"
      "llama3.2-vision:11b"
      "llama3.2:3b"
      "qwen2.5-coder:14b"
      "qwen3-coder:30b"
      "qwen3-vl:30b"
      "qwen3.5:27b"
      "translategemma:27b"
    ];
    syncModels = true;
  };
}
