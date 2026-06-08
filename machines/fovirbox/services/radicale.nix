{...}: {
  virtualisation.oci-containers.containers."radicale" = {
    autoStart = true;
    image = "tomsquest/docker-radicale:latest";
    ports = ["127.0.0.1:5232:5232"];
    volumes = [
      "radicale_data:/data"
      "radicale_config:/config:ro"
    ];
  };
}
