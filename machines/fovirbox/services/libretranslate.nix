{...}: {
  virtualisation.oci-containers.containers."libretranslate" = {
    image = "libretranslate/libretranslate:latest";
    ports = ["127.0.0.1:5234:5000"];
  };
}
