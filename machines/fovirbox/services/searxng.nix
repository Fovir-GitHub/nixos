{...}: {
  virtualisation.oci-containers.containers."searxng" = {
    autoStart = true;
    image = "searxng/searxng:latest";
    ports = ["127.0.0.1:8888:8080"];
    pull = "newer";
    volumes = [
      "searxng_config:/etc/searxng"
      "searxng_data:/var/cache/searxng"
    ];
    environment = import ../values/searxng-env.nix;
  };
}
