{...}: {
  virtualisation.oci-containers.containers."valkey" = {
    autoStart = true;
    cmd = [
      "valkey-server"
      "--save"
      "20"
      "1"
    ];
    image = "valkey/valkey:latest";
    ports = ["127.0.0.1:6379:6379"];
    volumes = ["${import ../values/podman-data-dir.nix}/valkey:/data"];
  };
}
