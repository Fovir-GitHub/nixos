{...}: {
  services.ollama = {
    enable = true;

    loadModels = ["llama3.1:70b"];
    syncModels = true;
  };
}
