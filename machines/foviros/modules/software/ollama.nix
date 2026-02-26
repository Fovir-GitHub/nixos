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
    loadModels = [
      "codellama:13b"
      "gemma3:12b"
      "gpt-oss:20b"
      "llama3.2-vision:11b"
      "llama3.2:3b"
      "qwen3-vl:30b"
    ];
    syncModels = true;
  };
}
