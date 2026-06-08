{...}: {
  virtualisation.oci-containers.containers."gotify" = {
    image = "gotify/server";

    environment = import ../values/gotify-env.nix;
    ports = ["127.0.0.1:8775:80"];
    volumes = ["gotify:/app/data"];
  };
}
