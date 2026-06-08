{...}: {
  virtualisation.oci-containers.containers."syncthing" = {
    autoStart = true;
    image = "syncthing/syncthing";
    ports = ["127.0.0.1:8384:8384"];
    volumes = ["syncthing:/var/syncthing"];
  };
}
