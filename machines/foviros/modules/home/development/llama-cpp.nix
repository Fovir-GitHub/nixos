{pkgs, ...}: {
  home.packages = with pkgs; [
    (llama-cpp.override {cudaSupport = true;})
  ];
}
